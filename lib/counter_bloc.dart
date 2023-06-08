import 'dart:async';

enum CounterAction { Increament, Decreament, Reset }

int counter = 0;

class CounterBloc {
  final stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => stateStreamController.sink;
  Stream<int> get counterStream => stateStreamController.stream;

  final eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => eventStreamController.sink;
  Stream<CounterAction> get eventStream => eventStreamController.stream;

  CounterBloc() {
    eventStream.listen((event) {
      if (event == CounterAction.Increament)
        counter++;
      else if (event == CounterAction.Decreament)
        counter--;
      else if (event == CounterAction.Reset) counter = 0;

      counterSink.add(counter);
    });
  }
  void dispose() {
    stateStreamController.close();
    eventStreamController.close();
  }
}
