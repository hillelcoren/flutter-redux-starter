import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hillelcoren/redux/ui/ui_actions.dart';
import 'package:hillelcoren/ui/product/product_screen.dart';
import 'package:hillelcoren/utils/localization.dart';
import 'package:redux/redux.dart';
import 'package:hillelcoren/redux/product/product_actions.dart';
import 'package:hillelcoren/data/models/models.dart';
import 'package:hillelcoren/ui/product/edit/product_edit.dart';
import 'package:hillelcoren/redux/app/app_state.dart';
import 'package:hillelcoren/ui/app/snackbar_row.dart';

class ProductEditScreen extends StatelessWidget {
  static final String route = '/product/edit';
  ProductEditScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductEditVM>(
      converter: (Store<AppState> store) {
        return ProductEditVM.fromStore(store);
      },
      builder: (context, vm) {
        return ProductEdit(
          viewModel: vm,
        );
      },
    );
  }
}

class ProductEditVM {
  final ProductEntity product;
  final Function(ProductEntity) onChanged;
  final Function(BuildContext) onSavePressed;
  final Function(BuildContext, EntityAction) onActionSelected;
  final Function onBackPressed;
  final bool isLoading;
  final bool isDirty;

  ProductEditVM({
    @required this.product,
    @required this.onChanged,
    @required this.onSavePressed,
    @required this.onBackPressed,
    @required this.onActionSelected,
    @required this.isLoading,
    @required this.isDirty,
  });

  factory ProductEditVM.fromStore(Store<AppState> store) {
    final product = store.state.productUIState.selected;

    return ProductEditVM(
      isLoading: store.state.isLoading,
      isDirty: product.isNew(),
      product: product,
      onChanged: (ProductEntity product) {
        store.dispatch(UpdateProduct(product));
      },
      onBackPressed: () {
        store.dispatch(UpdateCurrentRoute(ProductScreen.route));
      },
      onSavePressed: (BuildContext context) {
        final Completer<Null> completer = new Completer<Null>();
        store.dispatch(SaveProductRequest(completer: completer, product: product));
        return completer.future.then((_) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: SnackBarRow(
                message: product.isNew()
                    ? AppLocalization.of(context).successfullyCreatedProduct
                    : AppLocalization.of(context).successfullyUpdatedProduct,
              ),
              duration: Duration(seconds: 3)));
        });
      },
      onActionSelected: (BuildContext context, EntityAction action) {
        final Completer<Null> completer = new Completer<Null>();
        var message = '';
        switch (action) {
          case EntityAction.archive:
            store.dispatch(ArchiveProductRequest(completer, product.id));
            message = AppLocalization.of(context).successfullyArchivedProduct;
            break;
          case EntityAction.delete:
            store.dispatch(DeleteProductRequest(completer, product.id));
            message = AppLocalization.of(context).successfullyDeletedProduct;
            break;
          case EntityAction.restore:
            store.dispatch(RestoreProductRequest(completer, product.id));
            message = AppLocalization.of(context).successfullyRestoredProduct;
            break;
        }
        return completer.future.then((_) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: SnackBarRow(
                message: message,
              ),
              duration: Duration(seconds: 3)));
        });
      }
    );
  }
}
