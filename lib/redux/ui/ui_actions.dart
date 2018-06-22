import 'package:flutter_redux_starter/redux/app/app_actions.dart';

class UpdateCurrentRoute implements PersistUI {
  final String route;
  UpdateCurrentRoute(this.route);
}