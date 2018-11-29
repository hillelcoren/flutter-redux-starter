import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutterreduxrad/data/models/models.dart';

part 'static_state.g.dart';

abstract class StaticState implements Built<StaticState, StaticStateBuilder> {

  factory StaticState() {
    return _$StaticState._(
      currencyMap: BuiltMap<int, CurrencyEntity>(),
      timezoneMap: BuiltMap<int, TimezoneEntity>(),
      dateFormatMap: BuiltMap<int, DateFormatEntity>(),
      datetimeFormatMap: BuiltMap<int, DatetimeFormatEntity>(),
      languageMap: BuiltMap<int, LanguageEntity>(),
      countryMap: BuiltMap<int, CountryEntity>(),
    );
  }
  StaticState._();

  BuiltMap<int, CurrencyEntity> get currencyMap;
  BuiltMap<int, TimezoneEntity> get timezoneMap;
  BuiltMap<int, DateFormatEntity> get dateFormatMap;
  BuiltMap<int, DatetimeFormatEntity> get datetimeFormatMap;
  BuiltMap<int, LanguageEntity> get languageMap;
  BuiltMap<int, CountryEntity> get countryMap;

  static Serializer<StaticState> get serializer => _$staticStateSerializer;
}
