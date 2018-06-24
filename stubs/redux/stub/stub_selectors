import 'package:memoize/memoize.dart';
import 'package:built_collection/built_collection.dart';
import 'package:hillelcoren/data/models/models.dart';
import 'package:hillelcoren/redux/ui/list_ui_state.dart';

var memoizedDropdownStubList = memo3((
    BuiltMap<int, StubEntity> stubMap,
    BuiltList<int> stubList,
    String filter) => dropdownStubsSelector(stubMap, stubList, filter)
);

List<int> dropdownStubsSelector(
    BuiltMap<int, StubEntity> stubMap,
    BuiltList<int> stubList,
    String filter) {

  var list = stubList.where((stubId) {
    var stub = stubMap[stubId];
    if (! stub.isActive()) {
      return false;
    }
    return stub.matchesSearch(filter);
  }).toList();

  list.sort((stubAId, stubBId) {
    var stubA = stubMap[stubAId];
    var stubB = stubMap[stubBId];
    return stubA.compareTo(stubB, StubFields.name, true);
  });
  print(list.toString());
  return list;
}


var memoizedStubList = memo3((
    BuiltMap<int, StubEntity> stubMap,
    BuiltList<int> stubList,
    ListUIState stubListState) => visibleStubsSelector(stubMap, stubList, stubListState)
);

List<int> visibleStubsSelector(
    BuiltMap<int, StubEntity> stubMap,
    BuiltList<int> stubList,
    ListUIState stubListState) {

  var list = stubList.where((stubId) {
    var stub = stubMap[stubId];
    if (! stub.matchesStates(stubListState.stateFilters)) {
      return false;
    }
    return stub.matchesSearch(stubListState.search);
  }).toList();

  list.sort((stubAId, stubBId) {
    var stubA = stubMap[stubAId];
    var stubB = stubMap[stubBId];
    return stubA.compareTo(stubB, stubListState.sortField, stubListState.sortAscending);
  });

  return list;
}