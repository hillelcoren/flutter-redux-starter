import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {

  String get email;
  String get password;
  bool get isInitialized;
  bool get isAuthenticated;

  @nullable
  String get error;

  factory AuthState() {
    return _$AuthState._(
      email: '',
      password: '',
      isAuthenticated: false,
      isInitialized: false,
    );
  }

  AuthState._();
  static Serializer<AuthState> get serializer => _$authStateSerializer;
}
