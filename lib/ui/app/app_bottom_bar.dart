import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxrad/redux/app/app_state.dart';
import 'package:flutterreduxrad/redux/ui/list_ui_state.dart';
import 'package:flutterreduxrad/data/models/models.dart';
import 'package:redux/redux.dart';

class AppBottomBar extends StatefulWidget {

  final List<String> sortFields;
  final Function(String) onSelectedSortField;
  final EntityType entityType;

  AppBottomBar(
      {this.sortFields,
        this.onSelectedSortField,
        this.entityType});

  @override
  _AppBottomBarState createState() => new _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  PersistentBottomSheetController _sortController;

  @override
  Widget build(BuildContext context) {
    final _showSortSheet = () {
      if (_sortController != null) {
        _sortController.close();
        return;
      }

      _sortController  = Scaffold.of(context).showBottomSheet((context) {
        return StoreConnector<AppState, ListUIState>(
          converter: (Store<AppState> store) => store.state.getListState(widget.entityType),
          builder: (BuildContext context, listUIState) {
            return Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.sortFields.map((sortField) {
                    return RadioListTile(
                      dense: true,
                      // TODO replace with localization
                      title: Text(sortField[0].toUpperCase() + sortField.substring(1)),
                      subtitle: sortField == listUIState.sortField
                          ? Text(listUIState.sortAscending
                          ? 'Ascending'
                          : 'Descending')
                          : null,
                      groupValue: listUIState.sortField,
                      onChanged: (value) {
                        widget.onSelectedSortField(value);
                      },
                      value: sortField,
                    );
                  }).toList()),
            );
          },
        );
      });

      _sortController.closed.whenComplete(() {
        _sortController = null;
      });
    };

    return new BottomAppBar(
      child: Row(
        children: <Widget>[
          IconButton(
            tooltip: 'Sort',
            icon: Icon(Icons.sort_by_alpha),
            onPressed: _showSortSheet,
          ),
        ],
      ),
    );
  }
}