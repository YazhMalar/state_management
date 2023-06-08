import 'actions.dart';

int counterReducer(int state, dynamic action) {
  if (action is IncrementAction) {
    return state + 1;
  } else if (action is DecrementAction) {
    return state - 1;
  } else if (action is ResetAction) {
    return state = 0;
  }
  return state;
}
