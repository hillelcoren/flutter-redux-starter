import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxrad/data/models/models.dart';
import 'package:flutterreduxrad/redux/app/app_state.dart';
import 'package:flutterreduxrad/redux/ui/list_ui_state.dart';
import 'package:redux/redux.dart';

class AppSearchButton extends StatelessWidget {

  final EntityType entityType;
  final Function onSearchPressed;

  AppSearchButton({
    this.entityType,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ListUIState>(
      converter: (Store<AppState> store) =>
          store.state.getListState(entityType),
      distinct: true,
      builder: (BuildContext context, listUIState) {
        return IconButton(
          icon: Icon(listUIState.search == null ? Icons.search : Icons.close),
          tooltip: 'Search',
          onPressed: () => onSearchPressed(listUIState.search == null ? '' : null),
        );
      },
    );
  }
}
