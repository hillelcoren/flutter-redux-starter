import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutterreduxrad/data/models/models.dart';
import 'package:flutterreduxrad/redux/app/data_state.dart';
import 'package:flutterreduxrad/redux/auth/auth_state.dart';
import 'package:flutterreduxrad/redux/static/static_state.dart';
import 'package:flutterreduxrad/redux/ui/entity_ui_state.dart';
import 'package:flutterreduxrad/redux/ui/list_ui_state.dart';
import 'package:flutterreduxrad/redux/ui/ui_state.dart';
// STARTER: import - do not remove comment

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  bool get isLoading;
  bool get isSaving;
  AuthState get authState;
  UIState get uiState;
  DataState get dataState;
  StaticState get staticState;

  factory AppState({String appVersion, bool enableDarkMode}) {
    return _$AppState._(
      isLoading: false,
      isSaving: false,
      authState: AuthState(),
      uiState: UIState(enableDarkMode: enableDarkMode),
      dataState: DataState(),
      staticState: StaticState()
    );
  }

  AppState._();
  static Serializer<AppState> get serializer => _$appStateSerializer;

 /*  bool get isLoaded {
    return dashboardState.isLoaded
        && productState.isLoaded
        && clientState.isLoaded;
  } */

  EntityUIState getUIState(EntityType type) {
    switch (type) {
      // STARTER: states switch - do not remove comment
      default:
        return null;
    }
  }

  ListUIState getListState(EntityType type) {
    return getUIState(type).listUIState;
  }

  // STARTER: state getters - do not remove comment

  @override
  String toString() {
    //return 'Is Loading: ${this.isLoading}, Invoice: ${this.invoiceUIState.selected}';
    //return 'Date Formats: ${staticState.dateFormatMap}';
    return 'Route: ${uiState.currentRoute}, Dark Mode: ${uiState.enableDarkMode}';
  }
}