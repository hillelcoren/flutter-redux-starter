import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:hillelcoren/constants.dart';
import 'package:hillelcoren/data/models/models.dart';
import 'package:hillelcoren/redux/ui/entity_ui_state.dart';
import 'package:hillelcoren/redux/ui/list_ui_state.dart';

part 'stub_state.g.dart';

abstract class StubState implements Built<StubState, StubStateBuilder> {

  @nullable
  int get lastUpdated;

  BuiltMap<int, StubEntity> get map;
  BuiltList<int> get list;

  factory StubState() {
    return _$StubState._(
      map: BuiltMap<int, StubEntity>(),
      list: BuiltList<int>(),
    );
  }

  bool get isStale {
    if (! isLoaded) {
      return true;
    }

    return DateTime.now().millisecondsSinceEpoch - lastUpdated > kMillisecondsToRefreshData;
  }

  bool get isLoaded {
    return lastUpdated != null;
  }

  StubState._();
  static Serializer<StubState> get serializer => _$stubStateSerializer;
}

abstract class StubUIState extends Object with EntityUIState implements Built<StubUIState, StubUIStateBuilder> {

  @nullable
  StubEntity get selected;

  bool get isSelectedNew => selected.isNew();

  factory StubUIState() {
    return _$StubUIState._(
      listUIState: ListUIState(StubFields.name),
      selected: StubEntity(),
      dropdownFilter: '',
    );
  }

  StubUIState._();
  static Serializer<StubUIState> get serializer => _$stubUIStateSerializer;
}