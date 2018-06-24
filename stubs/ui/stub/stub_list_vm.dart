import 'dart:async';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hillelcoren/redux/stub/stub_selectors.dart';
import 'package:hillelcoren/ui/app/snackbar_row.dart';
import 'package:hillelcoren/utils/localization.dart';
import 'package:hillelcoren/data/models/models.dart';
import 'package:hillelcoren/ui/stub/stub_list.dart';
import 'package:hillelcoren/redux/app/app_state.dart';
import 'package:hillelcoren/redux/stub/stub_actions.dart';

class StubListBuilder extends StatelessWidget {
  static final String route = '/stubs/edit';
  StubListBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StubListVM>(
      //rebuildOnChange: true,
      converter: StubListVM.fromStore,
      builder: (context, vm) {
        return StubList(
          viewModel: vm,
        );
      },
    );
  }
}

class StubListVM {
  final List<int> stubList;
  final BuiltMap<int, StubEntity> stubMap;
  final BuiltMap<int, ClientEntity> clientMap;
  final bool isLoading;
  final bool isLoaded;
  final Function(BuildContext, StubEntity) onStubTap;
  final Function(BuildContext, StubEntity, DismissDirection) onDismissed;
  final Function(BuildContext) onRefreshed;

  StubListVM({
    @required this.stubList,
    @required this.stubMap,
    @required this.clientMap,
    @required this.isLoading,
    @required this.isLoaded,
    @required this.onStubTap,
    @required this.onDismissed,
    @required this.onRefreshed,
  });

  static StubListVM fromStore(Store<AppState> store) {
    Future<Null> _handleRefresh(BuildContext context) {
      final Completer<Null> completer = new Completer<Null>();
      store.dispatch(LoadStubs(completer, true));
      return completer.future.then((_) {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: SnackBarRow(
              message: AppLocalization.of(context).refreshComplete,
            ),
            duration: Duration(seconds: 3)));
      });
    }

    return StubListVM(
        stubList: memoizedStubList(store.state.stubState.map,
            store.state.stubState.list, store.state.stubListState),
        stubMap: store.state.stubState.map,
        clientMap: store.state.clientState.map,
        isLoading: store.state.isLoading,
        isLoaded: store.state.stubState.isLoaded &&
            store.state.clientState.isLoaded,
        onStubTap: (context, stub) {
          store.dispatch(ViewStub(stub: stub, context: context));
        },
        onRefreshed: (context) => _handleRefresh(context),
        onDismissed: (BuildContext context, StubEntity stub,
            DismissDirection direction) {
          final Completer<Null> completer = new Completer<Null>();
          var message = '';
          if (direction == DismissDirection.endToStart) {
            if (stub.isArchived()) {
              store.dispatch(RestoreStubRequest(completer, stub.id));
              message = AppLocalization.of(context).successfullyRestoredStub;
            } else {
              store.dispatch(ArchiveStubRequest(completer, stub.id));
              message = AppLocalization.of(context).successfullyArchivedStub;
            }
          } else if (direction == DismissDirection.startToEnd) {
            if (stub.isArchived() || stub.isDeleted) {
              store.dispatch(RestoreStubRequest(completer, stub.id));
              message = AppLocalization.of(context).successfullyRestoredStub;
            } else {
              store.dispatch(DeleteStubRequest(completer, stub.id));
              message = AppLocalization.of(context).successfullyDeletedStub;
            }
          }
          return completer.future.then((_) {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: SnackBarRow(
                  message: message,
                ),
                duration: Duration(seconds: 3)));
          });
        });
  }
}
