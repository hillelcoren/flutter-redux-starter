import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_redux_starter/data/models/models.dart';
import 'package:flutter_redux_starter/data/models/serializers.dart';
import 'package:flutter_redux_starter/data/web_client.dart';

class AuthRepository {
  final WebClient webClient;

  const AuthRepository({
    this.webClient = const WebClient(),
  });

  Future<BuiltList<dynamic>> login(String email, String password) async {

    final credentials = {
      'email': email,
      'password': password,
    };

    var url = 'https://example.com/login';

    final response = await webClient.post(url, json.encode(credentials));

    LoginResponse loginResponse = serializers.deserializeWith(
        LoginResponse.serializer, response);

    return loginResponse.data.toBuiltList();
  }
}