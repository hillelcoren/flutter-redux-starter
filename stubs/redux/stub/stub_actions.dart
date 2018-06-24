import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:hillelcoren/data/models/models.dart';
import 'package:hillelcoren/redux/app/app_actions.dart';

class LoadStubs {
  final Completer completer;
  final bool force;

  LoadStubs([this.completer, this.force = false]);
}

class LoadStubsRequest implements StartLoading {}

class LoadStubsFailure implements StopLoading {
  final dynamic error;
  LoadStubsFailure(this.error);

  @override
  String toString() {
    return 'LoadStubsFailure{error: $error}';
  }
}

class LoadStubsSuccess implements StopLoading, PersistData {
  final BuiltList<StubEntity> stubs;
  LoadStubsSuccess(this.stubs);

  @override
  String toString() {
    return 'LoadStubsSuccess{stubs: $stubs}';
  }
}

class ViewStub implements PersistUI {
  final StubEntity stub;
  final BuildContext context;
  ViewStub({this.stub, this.context});
}

class EditStub implements PersistUI {
  final StubEntity stub;
  final BuildContext context;
  EditStub({this.stub, this.context});
}

class UpdateStub implements PersistUI {
  final StubEntity stub;
  UpdateStub(this.stub);
}

class AddContact implements PersistUI {}

class UpdateContact implements PersistUI {
  final int index;
  final ContactEntity contact;
  UpdateContact({this.index, this.contact});
}

class DeleteContact implements PersistUI {
  final int index;
  DeleteContact(this.index);
}

class SaveStubRequest implements StartLoading {
  final Completer completer;
  final StubEntity stub;
  SaveStubRequest({this.completer, this.stub});
}

class SaveStubSuccess implements StopLoading, PersistData {
  final StubEntity stub;

  SaveStubSuccess(this.stub);
}

class SaveStubFailure implements StopLoading {
  final String error;
  SaveStubFailure (this.error);
}

class ArchiveStubRequest implements StartLoading {
  final Completer completer;
  final int stubId;

  ArchiveStubRequest(this.completer, this.stubId);
}

class ArchiveStubSuccess implements StopLoading, PersistData {
  final StubEntity stub;
  ArchiveStubSuccess(this.stub);
}

class ArchiveStubFailure implements StopLoading {
  final StubEntity stub;
  ArchiveStubFailure(this.stub);
}

class DeleteStubRequest implements StartLoading {
  final Completer completer;
  final int stubId;

  DeleteStubRequest(this.completer, this.stubId);
}

class DeleteStubSuccess implements StopLoading, PersistData {
  final StubEntity stub;
  DeleteStubSuccess(this.stub);
}

class DeleteStubFailure implements StopLoading {
  final StubEntity stub;
  DeleteStubFailure(this.stub);
}

class RestoreStubRequest implements StartLoading {
  final Completer completer;
  final int stubId;
  RestoreStubRequest(this.completer, this.stubId);
}

class RestoreStubSuccess implements StopLoading, PersistData {
  final StubEntity stub;
  RestoreStubSuccess(this.stub);
}

class RestoreStubFailure implements StopLoading {
  final StubEntity stub;
  RestoreStubFailure(this.stub);
}

class AddStubSuccess implements StopLoading, PersistData {
  final StubEntity stub;
  AddStubSuccess(this.stub);
}



class SearchStubs {
  final String search;
  SearchStubs(this.search);
}

class SortStubs implements PersistUI {
  final String field;
  SortStubs(this.field);
}

class FilterStubsByState implements PersistUI {
  final EntityState state;

  FilterStubsByState(this.state);
}

class FilterStubDropdown {
  final String filter;
  FilterStubDropdown(this.filter);
}
