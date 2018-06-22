import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_redux_starter/ui/auth/login_vm.dart';

part 'ui_state.g.dart';

abstract class UIState implements Built<UIState, UIStateBuilder> {

  String get currentRoute;

  factory UIState() {
    return _$UIState._(
      currentRoute: LoginScreen.route,
    );
  }

  UIState._();
  static Serializer<UIState> get serializer => _$uIStateSerializer;
}

