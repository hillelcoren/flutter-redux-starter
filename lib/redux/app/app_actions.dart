import 'dart:async';
import 'package:flutterreduxrad/data/models/entities.dart';

class PersistUI {}
class PersistData {}

class RefreshClient {
  final int clientId;
  RefreshClient(this.clientId);
}

class StartLoading {}
class StopLoading {}

class StartSaving {}
class StopSaving {}

class LoadStaticSuccess {
  final StaticData data;
  LoadStaticSuccess(this.data);
}

class UserSettingsChanged implements PersistUI {
  final bool enableDarkMode;
  UserSettingsChanged({this.enableDarkMode});
}

class LoadDataSuccess {
  final Completer completer;
  final dynamic loginResponse;
  LoadDataSuccess({this.loginResponse, this.completer});
}

class RefreshData {
  final String platform;
  final Completer completer;
  RefreshData({this.platform, this.completer});
}