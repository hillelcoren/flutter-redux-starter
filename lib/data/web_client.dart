import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WebClient {
  const WebClient();

  Future<dynamic> get(String url) async {
    final http.Response response = await http.Client().get(
          url,
        );

    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.body);
    }

    return json.decode(response.body);
  }

  Future<dynamic> post(String url, dynamic data) async {
    final http.Response response = await http.Client().post(
      url,
      body: data,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.body);
    }

    try {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
  }

  Future<dynamic> put(String url, dynamic data) async {
    final http.Response response = await http.Client().put(
      url,
      body: data,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.body);
    }

    try {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
  }
}
