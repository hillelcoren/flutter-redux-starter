import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutterreduxrad/ui/home/home_screen.dart';
// STARTER: import - do not remove comment

part 'ui_state.g.dart';

abstract class UIState implements Built<UIState, UIStateBuilder> {

  String get currentRoute;
  bool get enableDarkMode;

  // STARTER: properties - do not remove comment

  factory UIState({bool enableDarkMode}) {
    return _$UIState._(
      //currentRoute: LoginScreen.route,
      currentRoute: HomeScreen.route,
      enableDarkMode: enableDarkMode ?? false,
      // STARTER: constructor - do not remove comment
    );
  }

  UIState._();
  static Serializer<UIState> get serializer => _$uIStateSerializer;
}

