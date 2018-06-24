import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_redux_starter/ui/home/home_screen.dart';

part 'ui_state.g.dart';

abstract class UIState implements Built<UIState, UIStateBuilder> {

  String get currentRoute;

  factory UIState() {
    return _$UIState._(
      //currentRoute: LoginScreen.route,
      currentRoute: HomeScreen.route,
    );
  }

  UIState._();
  static Serializer<UIState> get serializer => _$uIStateSerializer;
}

