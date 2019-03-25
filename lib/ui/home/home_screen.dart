import 'package:flutter/material.dart';
import 'package:flutter_redux_starter/localizations.dart';
import 'package:flutter_redux_starter/ui/app/app_drawer_vm.dart';

class HomeScreen extends StatelessWidget {

  static final String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).homeTitle),
      ),
      drawer: AppDrawerBuilder(),
    );
  }
}
