import 'package:flutterreduxrad/redux/app/app_actions.dart';
import 'package:flutterreduxrad/redux/static/static_state.dart';
import 'package:redux/redux.dart';

Reducer<StaticState> staticReducer = combineReducers([
  TypedReducer<StaticState, LoadStaticSuccess>(staticLoadedReducer),
  TypedReducer<StaticState, RefreshData>(refreshData),
]);

StaticState refreshData(StaticState staticState, RefreshData action) {
  return StaticState();
}

StaticState staticLoadedReducer(StaticState staticState, LoadStaticSuccess action) {
  return StaticState().rebuild((b) => b
    ..currencyMap.addAll(Map.fromIterable(
      action.data.currencies,
      key: (dynamic item) => item.id,
      value: (dynamic item) => item,
    ))
     ..timezoneMap.addAll(Map.fromIterable(
      action.data.timezones,
      key: (dynamic item) => item.id,
      value: (dynamic item) => item,
    ))
    ..dateFormatMap.addAll(Map.fromIterable(
      action.data.dateFormats,
      key: (dynamic item) => item.id,
      value: (dynamic item) => item,
    ))
    ..datetimeFormatMap.addAll(Map.fromIterable(
      action.data.datetimeFormats,
      key: (dynamic item) => item.id,
      value: (dynamic item) => item,
    ))
    ..languageMap.addAll(Map.fromIterable(
      action.data.languages,
      key: (dynamic item) => item.id,
      value: (dynamic item) => item,
    ))
    ..countryMap.addAll(Map.fromIterable(
      action.data.countries,
      key: (dynamic item) => item.id,
      value: (dynamic item) => item,
    ))
  );
}

