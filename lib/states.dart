import 'package:redux/redux.dart';
import 'reducers.dart';

Store<int> createStore() {
  final store = Store<int>(counterReducer, initialState: 0);
  return store;
}
