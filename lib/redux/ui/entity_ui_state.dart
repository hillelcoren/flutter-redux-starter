import 'package:flutter_redux_starter/redux/ui/list_ui_state.dart';

abstract class EntityUIState {

  bool get isSelectedNew;
  ListUIState get listUIState;
}