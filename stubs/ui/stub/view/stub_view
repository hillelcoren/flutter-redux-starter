import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hillelcoren/data/models/models.dart';
import 'package:hillelcoren/redux/app/app_state.dart';
import 'package:hillelcoren/ui/app/actions_menu_button.dart';
import 'package:hillelcoren/ui/app/icon_message.dart';
import 'package:hillelcoren/ui/app/stub/stub_item_view.dart';
import 'package:hillelcoren/ui/app/two_value_header.dart';
import 'package:hillelcoren/ui/stub/view/stub_view_vm.dart';
import 'package:hillelcoren/utils/localization.dart';
import 'package:url_launcher/url_launcher.dart';

class StubView extends StatefulWidget {
  final StubViewVM viewModel;

  StubView({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  _StubViewState createState() => new _StubViewState();
}

class _StubViewState extends State<StubView> {
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalization.of(context);
    var store = StoreProvider.of<AppState>(context);
    var viewModel = widget.viewModel;
    var stub = viewModel.stub;
    var client = viewModel.client;

    _launchURL() async {
      var url = 'http://www.google.com';
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false, forceWebView: false);
      } else {
        throw '${localization.couldNotLaunch}';
      }
    }

    _buildView() {
      var stub = widget.viewModel.stub;
      var widgets = <Widget>[
        TwoValueHeader(
          label1: localization.totalAmount,
          value1: stub.amount,
          label2: localization.balanceDue,
          value2: stub.balance,
        ),
      ];

      if (stub.privateNotes != null && stub.privateNotes.isNotEmpty) {
        widgets.add(IconMessage(stub.privateNotes));
      }

      Map<String, String> fields = {
        StubFields.stubDate: stub.stubDate,
        StubFields.dueDate: stub.dueDate,
        StubFields.partial: stub.partial.toStringAsFixed(2),
        StubFields.partialDueDate: stub.partialDueDate,
        StubFields.poNumber: stub.poNumber,
        StubFields.discount: stub.discount.toStringAsFixed(2),
      };

      List<Widget> fieldWidgets = [];
      fields.forEach((field, value) {
        if (value != null && value.isNotEmpty) {
          fieldWidgets.add(Row(
            children: <Widget>[
              SizedBox(
                child: Text(localization.lookup(field)),
                width: 100.0,
              ),
              Text(value),
            ],
          ));
          fieldWidgets.addAll([]);
        }
      });

      widgets.addAll([
        Divider(
          height: 1.0,
        ),
        ListTile(
          title: Text(client?.displayName ?? ''),
          leading: Icon(FontAwesomeIcons.users, size: 18.0),
          trailing: Icon(Icons.navigate_next),
          onTap: () => viewModel.onClientPressed(context),
        ),
        Divider(
          height: 1.0,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: fieldWidgets,
          ),
        )
      ]);

      stub.stubItems.forEach((stubItem) {
        widgets.add(StubItemListTile(stubItem));
      });

      return widgets;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text((localization.stub + ' ' + stub.stubNumber) ?? ''),
        actions: stub.isNew()
            ? []
            : [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    viewModel.onEditPressed(context);
                  },
                ),
                ActionMenuButton(
                  customActions: [
                    client.hasEmailAddress
                        ? ActionMenuChoice(
                            action: EntityAction.email,
                            icon: Icons.send,
                            label: AppLocalization.of(context).email,
                          )
                        : null,
                    ActionMenuChoice(
                      action: EntityAction.pdf,
                      icon: Icons.picture_as_pdf,
                      label: AppLocalization.of(context).pdf,
                    ),
                  ],
                  isLoading: viewModel.isLoading,
                  entity: stub,
                  onSelected: viewModel.onActionSelected,
                )
              ],
      ),
      body: ListView(
        children: _buildView(),
      ),
    );
  }
}
