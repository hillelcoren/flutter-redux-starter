import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hillelcoren/data/models/models.dart';
import 'package:hillelcoren/ui/app/dismissible_entity.dart';


class StubItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  //final ValueChanged<bool> onCheckboxChanged;
  final StubEntity stub;
  final ClientEntity client;

  static final stubItemKey = (int id) => Key('__stub_item_${id}__');

  StubItem({
    @required this.onDismissed,
    @required this.onTap,
    //@required this.onCheckboxChanged,
    @required this.stub,
    @required this.client,
  });

  @override
  Widget build(BuildContext context) {
    return DismissibleEntity(
      entity: stub,
      onDismissed: onDismissed,
      onTap: onTap,
      child: ListTile(
        onTap: onTap,
        /*
        leading: Checkbox(
          //key: NinjaKeys.stubItemCheckbox(stub.id),
          value: true,
          //onChanged: onCheckboxChanged,
          onChanged: (value) {
            return true;
          },
        ),
        */
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  client.displayName,
                  //stub.stubNumber,
                  //key: NinjaKeys.clientItemClientKey(client.id),
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(stub.stubNumber),
            /*
            stub.notes.isNotEmpty
                ? Text(
                    stub.notes,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                : Container(),
                */
            EntityStateLabel(stub),
          ],
        ),
        trailing: Text(stub.amount.toStringAsFixed(2),
            style: Theme.of(context).textTheme.title),
      ),
    );
  }
}
