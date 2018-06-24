import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_redux_starter/ui/home/home_screen.dart';
import 'package:built_collection/built_collection.dart';
// STARTER: import - do not remove comment

part 'ui_state.g.dart';

abstract class UIState implements Built<UIState, UIStateBuilder> {

  String get currentRoute;

  // STARTER: properties - do not remove comment

  factory UIState() {
    return _$UIState._(
      //currentRoute: LoginScreen.route,
      currentRoute: HomeScreen.route,
      // STARTER: constructor - do not remove comment
    );
  }

  UIState._();
  static Serializer<UIState> get serializer => _$uIStateSerializer;
}

