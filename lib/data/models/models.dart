import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'models.g.dart';

abstract class LoginResponse implements Built<LoginResponse, LoginResponseBuilder> {

  BuiltList<dynamic> get data;

  LoginResponse._();
  factory LoginResponse([updates(LoginResponseBuilder b)]) = _$LoginResponse;
  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
}
