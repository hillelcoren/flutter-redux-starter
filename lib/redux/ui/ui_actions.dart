import 'package:flutterreduxrad/redux/app/app_actions.dart';

class UpdateCurrentRoute implements PersistUI {
  final String route;
  UpdateCurrentRoute(this.route);
}