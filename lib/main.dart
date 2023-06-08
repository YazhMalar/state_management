import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management/counter_bloc.dart';
import 'actions.dart';
import 'states.dart' as appStore;

void main() {
  final store = appStore.createStore();

  runApp(FlutterReduxApp(
    title: 'Flutter Redux Demo',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<int> store;
  final String title;

  FlutterReduxApp({
    required this.store,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: StoreConnector<int, String>(
              converter: (store) => store.state.toString(),
              builder: (context, count) {
                return Center(
                  child: Text(
                    'The button has been pushed this many times: $count',
                  ),
                );
              },
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StoreConnector<int, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(IncrementAction(counter));
                },
                builder: (context, callback) {
                  return FloatingActionButton(
                    onPressed: callback,
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  );
                },
              ),
              StoreConnector<int, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(ResetAction(counter));
                },
                builder: (context, callback) {
                  return FloatingActionButton(
                    onPressed: callback,
                    tooltip: 'Increment',
                    child: Icon(Icons.refresh),
                  );
                },
              ),
              StoreConnector<int, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(DecrementAction(counter));
                },
                builder: (context, callback) {
                  return FloatingActionButton(
                    onPressed: callback,
                    tooltip: 'Increment',
                    child: Icon(Icons.remove),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
