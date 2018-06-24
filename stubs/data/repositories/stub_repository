import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:hillelcoren/data/models/serializers.dart';
import 'package:hillelcoren/redux/auth/auth_state.dart';
import 'package:hillelcoren/data/models/models.dart';
import 'package:hillelcoren/data/web_stub.dart';

class StubRepository {
  final WebStub webStub;

  const StubRepository({
    this.webStub = const WebStub(),
  });

  Future<BuiltList<StubEntity>> loadList(CompanyEntity company, AuthState auth) async {

    final response = await webStub.get(
        auth.url + '/stubs', company.token);

    StubListResponse stubResponse = serializers.deserializeWith(
        StubListResponse.serializer, response);

    return stubResponse.data;
  }

  Future saveData(CompanyEntity company, AuthState auth, StubEntity stub) async {

    var data = serializers.serializeWith(StubEntity.serializer, stub);
    var response;

    if (stub.isNew()) {
      response = await webStub.post(
          auth.url + '/stubs', company.token, json.encode(data));
    } else {
      var url = auth.url + '/stubs/' + stub.id.toString();
      response = await webStub.put(url, company.token, json.encode(data));
    }

    StubItemResponse stubResponse = serializers.deserializeWith(
        StubItemResponse.serializer, response);

    return stubResponse.data;
  }
}