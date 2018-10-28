import 'package:flutterreduxrad/redux/ui/ui_actions.dart';
import 'package:flutterreduxrad/redux/ui/ui_state.dart';
import 'package:redux/redux.dart';
// STARTER: import - do not remove comment

UIState uiReducer(UIState state, action) {

  return state.rebuild((b) => b
    ..currentRoute = currentRouteReducer(state.currentRoute, action)
    // STARTER: reducer - do not remove comment
  );
}

Reducer<String> currentRouteReducer = combineReducers([
  TypedReducer<String, UpdateCurrentRoute>(updateCurrentRouteReducer),
]);

String updateCurrentRouteReducer(String currentRoute, UpdateCurrentRoute action) {
  return action.route;
}
