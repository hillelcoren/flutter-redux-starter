import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_redux_starter/data/models/models.dart';
import 'package:flutter_redux_starter/redux/app/app_state.dart';
import 'package:flutter_redux_starter/redux/app/data_state.dart';
import 'package:flutter_redux_starter/redux/auth/auth_state.dart';
import 'package:flutter_redux_starter/redux/ui/ui_state.dart';
// STARTER: import [do not remove comment]

part 'serializers.g.dart';

@SerializersFor(const [
  AppState,
  LoginResponse,
  // STARTER: serializers [do not remove comment]
])
final Serializers serializers =
(_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();