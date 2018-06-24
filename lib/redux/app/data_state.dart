import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'data_state.g.dart';

abstract class DataState implements Built<DataState, DataStateBuilder> {

  //ProductState get productState;

  factory DataState() {
    return _$DataState._(
      //productState: ProductState(),
    );
  }

  DataState._();
  static Serializer<DataState> get serializer => _$dataStateSerializer;
}