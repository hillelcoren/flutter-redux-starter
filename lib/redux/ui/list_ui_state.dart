import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_ui_state.g.dart';

abstract class ListUIState implements Built<ListUIState, ListUIStateBuilder> {

  @nullable
  String get search;

  String get sortField;
  bool get sortAscending;

  factory ListUIState(sortField) {
    return _$ListUIState._(
      sortField: sortField,
      sortAscending: true,
    );
  }

  ListUIState._();
  static Serializer<ListUIState> get serializer => _$listUIStateSerializer;
}