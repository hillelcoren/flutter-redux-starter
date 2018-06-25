import 'package:flutter/widgets.dart';
import 'package:flutter_redux_starter/data/file_storage.dart';
import 'package:flutter_redux_starter/data/repositories/persistence_repository.dart';
import 'package:flutter_redux_starter/redux/app/app_actions.dart';
import 'package:flutter_redux_starter/redux/app/app_state.dart';
import 'package:flutter_redux_starter/redux/app/data_state.dart';
import 'package:flutter_redux_starter/redux/auth/auth_actions.dart';
import 'package:flutter_redux_starter/redux/auth/auth_state.dart';
import 'package:flutter_redux_starter/redux/ui/ui_state.dart';
import 'package:flutter_redux_starter/ui/home/home_screen.dart';
import 'package:redux/redux.dart';
import 'package:path_provider/path_provider.dart';

List<Middleware<AppState>> createStorePersistenceMiddleware([
  PersistenceRepository authRepository = const PersistenceRepository(
    fileStorage: const FileStorage(
      'auth_state',
      getApplicationDocumentsDirectory,
    ),
  ),
  PersistenceRepository uiRepository = const PersistenceRepository(
    fileStorage: const FileStorage(
      'ui_state',
      getApplicationDocumentsDirectory,
    ),
  ),
  PersistenceRepository dataRepository = const PersistenceRepository(
    fileStorage: const FileStorage(
      'data_state',
      getApplicationDocumentsDirectory,
    ),
  ),
]) {
  final loadState = _createLoadState(
      authRepository,
      uiRepository,
      dataRepository);
  final userLoggedIn = _createUserLoggedIn(
      authRepository,
      uiRepository);
  final uiChange = _createUIChange(uiRepository);
  final dataChange = _createDataChange(dataRepository);
  final deleteState = _createDeleteState(
      authRepository,
      uiRepository);

  return [
    TypedMiddleware<AppState, UserLogout>(deleteState),
    TypedMiddleware<AppState, LoadStateRequest>(loadState),
    TypedMiddleware<AppState, UserLoginSuccess>(userLoggedIn),
    TypedMiddleware<AppState, PersistUI>(uiChange),
    TypedMiddleware<AppState, PersistData>(dataChange),
  ];
}

Middleware<AppState> _createLoadState(
    PersistenceRepository authRepository,
    PersistenceRepository uiRepository,
    PersistenceRepository dataRepository,
    ) {
  AuthState authState;
  UIState uiState;
  DataState dataState;

  return (Store<AppState> store, action, NextDispatcher next) {

    // TODO passing back future/single catchError
    authRepository.exists().then((exists) {
      if (exists) {
        authRepository.loadAuthState().then((state) {
          authState = state;
          uiRepository.loadUIState().then((state) {
            uiState = state;
            dataRepository.loadDataState().then((state) {
              dataState = state;
              AppState appState = AppState().rebuild((b) => b
                ..authState.replace(authState)
                ..uiState.replace(uiState)
                ..dataState.replace(dataState));
              store.dispatch(LoadStateSuccess(appState));
              Navigator.of(action.context).pushReplacementNamed(uiState.currentRoute);
            }).catchError((error) => _handleError(store, error, action.context));
          }).catchError((error) => _handleError(store, error, action.context));
        }).catchError((error) => _handleError(store, error, action.context));
      } else {
        store.dispatch(UserLoginSuccess());
        Navigator.of(action.context).pushReplacementNamed(HomeScreen.route);

        //store.dispatch(UserLogout());
        //store.dispatch(LoadUserLogin(action.context));
      }
    });

    next(action);
  };
}

_handleError(store, error, context) {
  print(error);

  store.dispatch(UserLoginSuccess());
  Navigator.of(context).pushReplacementNamed(HomeScreen.route);

  //store.dispatch(UserLogout());
  //store.dispatch(LoadUserLogin(context));
}

Middleware<AppState> _createUserLoggedIn(
    PersistenceRepository authRepository,
    PersistenceRepository uiRepository,
    ) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    var state = store.state;

    authRepository.saveAuthState(state.authState);
    uiRepository.saveUIState(state.uiState);
  };
}

Middleware<AppState> _createUIChange(PersistenceRepository uiRepository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    uiRepository.saveUIState(store.state.uiState);
  };
}

Middleware<AppState> _createDataChange(PersistenceRepository dataRepository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    dataRepository.saveDataState(store.state.dataState);
  };
}

Middleware<AppState> _createDeleteState(
    PersistenceRepository authRepository,
    PersistenceRepository uiRepository,
    ) {
  return (Store<AppState> store, action, NextDispatcher next) {
    authRepository.delete();
    uiRepository.delete();

    next(action);
  };
}
