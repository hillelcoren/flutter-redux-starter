import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_starter/redux/app/app_state.dart';
import 'package:flutter_redux_starter/ui/app/app_drawer.dart';
import 'package:redux/redux.dart';

class AppDrawerBuilder extends StatelessWidget {
  AppDrawerBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppDrawerVM>(
      converter: AppDrawerVM.fromStore,
      builder: (context, viewModel) {
        return AppDrawer(viewModel: viewModel);
      },
    );
  }
}

class AppDrawerVM {

  AppDrawerVM();

  static AppDrawerVM fromStore(Store<AppState> store) {

    return AppDrawerVM();
  }
}
