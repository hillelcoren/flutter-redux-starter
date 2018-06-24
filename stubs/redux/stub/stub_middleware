import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:hillelcoren/data/models/models.dart';
import 'package:hillelcoren/redux/product/product_actions.dart';
import 'package:hillelcoren/redux/ui/ui_actions.dart';
import 'package:hillelcoren/ui/stub/edit/stub_edit_vm.dart';
import 'package:hillelcoren/ui/stub/view/stub_view_vm.dart';
import 'package:hillelcoren/redux/stub/stub_actions.dart';
import 'package:hillelcoren/redux/app/app_state.dart';
import 'package:hillelcoren/data/repositories/stub_repository.dart';

List<Middleware<AppState>> createStoreStubsMiddleware([
  StubRepository repository = const StubRepository(),
]) {
  final loadStubs = _loadStubs(repository);
  final saveStub = _saveStub(repository);
  final archiveStub = _archiveStub(repository);
  final deleteStub = _deleteStub(repository);
  final restoreStub = _restoreStub(repository);
  final editStub = _editStub();
  final viewStub = _viewStub();

  return [
    TypedMiddleware<AppState, LoadStubs>(loadStubs),
    TypedMiddleware<AppState, SaveStubRequest>(saveStub),
    TypedMiddleware<AppState, ArchiveStubRequest>(archiveStub),
    TypedMiddleware<AppState, DeleteStubRequest>(deleteStub),
    TypedMiddleware<AppState, RestoreStubRequest>(restoreStub),
    TypedMiddleware<AppState, EditStub>(editStub),
    TypedMiddleware<AppState, ViewStub>(viewStub),
  ];
}

Middleware<AppState> _editStub() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(StubEditScreen.route));
    Navigator.of(action.context).pushNamed(StubEditScreen.route);
  };
}

Middleware<AppState> _viewStub() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(StubViewScreen.route));
    Navigator.of(action.context).pushNamed(StubViewScreen.route);
  };
}

Middleware<AppState> _archiveStub(StubRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    var origStub = store.state.stubState.map[action.stubId];
    repository
        .saveData(store.state.selectedCompany, store.state.authState,
            origStub, EntityAction.archive)
        .then((stub) {
      store.dispatch(ArchiveStubSuccess(stub));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(ArchiveStubFailure(origStub));
    });

    next(action);
  };
}

Middleware<AppState> _deleteStub(StubRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    var origStub = store.state.stubState.map[action.stubId];
    repository
        .saveData(store.state.selectedCompany, store.state.authState,
            origStub, EntityAction.delete)
        .then((stub) {
      store.dispatch(DeleteStubSuccess(stub));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(DeleteStubFailure(origStub));
    });

    next(action);
  };
}

Middleware<AppState> _restoreStub(StubRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    var origStub = store.state.stubState.map[action.stubId];
    repository
        .saveData(store.state.selectedCompany, store.state.authState,
            origStub, EntityAction.restore)
        .then((stub) {
      store.dispatch(RestoreStubSuccess(stub));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(RestoreStubFailure(origStub));
    });

    next(action);
  };
}

Middleware<AppState> _saveStub(StubRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository
        .saveData(
            store.state.selectedCompany, store.state.authState, action.stub)
        .then((stub) {
      if (action.stub.isNew()) {
        store.dispatch(AddStubSuccess(stub));
      } else {
        store.dispatch(SaveStubSuccess(stub));
      }
      action.completer.complete(null);
    }).catchError((error) {
      print(error);
      store.dispatch(SaveStubFailure(error));
    });

    next(action);
  };
}

Middleware<AppState> _loadStubs(StubRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {

    AppState state = store.state;

    if (!state.stubState.isStale && !action.force) {
      next(action);
      return;
    }

    if (state.isLoading) {
      next(action);
      return;
    }

    store.dispatch(LoadStubsRequest());
    repository
        .loadList(state.selectedCompany, state.authState)
        .then((data) {
      store.dispatch(LoadStubsSuccess(data));

      if (action.completer != null) {
        action.completer.complete(null);
      }
      if (state.productState.isStale) {
        store.dispatch(LoadProducts());
      }
    }).catchError((error) {
      print(error);
      store.dispatch(LoadStubsFailure(error));
    });

    next(action);
  };
}
