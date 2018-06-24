import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// STARTER: import [do not remove comment]

part 'data_state.g.dart';

abstract class DataState implements Built<DataState, DataStateBuilder> {

  // STARTER: fields [do not remove comment]
  //ProductState get productState;

  factory DataState() {
    return _$DataState._(
      // STARTER: constructor [do not remove comment]
      //productState: ProductState(),
    );
  }

  DataState._();
  static Serializer<DataState> get serializer => _$dataStateSerializer;
}