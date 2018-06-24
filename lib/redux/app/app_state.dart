import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_redux_starter/data/models/models.dart';
import 'package:flutter_redux_starter/redux/app/data_state.dart';
import 'package:flutter_redux_starter/redux/auth/auth_state.dart';
import 'package:flutter_redux_starter/redux/ui/entity_ui_state.dart';
import 'package:flutter_redux_starter/redux/ui/list_ui_state.dart';
import 'package:flutter_redux_starter/redux/ui/ui_state.dart';
// STARTER: import - do not remove comment

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  bool get isLoading;
  AuthState get authState;
  UIState get uiState;
  DataState get dataState;

  factory AppState() {
    return _$AppState._(
      isLoading: false,
      authState: AuthState(),
      uiState: UIState(),
      dataState: DataState(),
    );
  }

  AppState._();
  static Serializer<AppState> get serializer => _$appStateSerializer;

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

  // STARTER: state getters [do not remove comment]

  /*
  @override
  String toString() {
    return 'Is Loading: ${this.isLoading}';
  }
  */
}