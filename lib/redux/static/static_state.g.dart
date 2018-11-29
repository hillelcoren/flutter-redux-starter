// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'static_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<StaticState> _$staticStateSerializer = new _$StaticStateSerializer();

class _$StaticStateSerializer implements StructuredSerializer<StaticState> {
  @override
  final Iterable<Type> types = const [StaticState, _$StaticState];
  @override
  final String wireName = 'StaticState';

  @override
  Iterable serialize(Serializers serializers, StaticState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'currencyMap',
      serializers.serialize(object.currencyMap,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(int), const FullType(CurrencyEntity)])),
      'timezoneMap',
      serializers.serialize(object.timezoneMap,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(int), const FullType(TimezoneEntity)])),
      'dateFormatMap',
      serializers.serialize(object.dateFormatMap,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(int), const FullType(DateFormatEntity)])),
      'datetimeFormatMap',
      serializers.serialize(object.datetimeFormatMap,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(int),
            const FullType(DatetimeFormatEntity)
          ])),
      'languageMap',
      serializers.serialize(object.languageMap,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(int), const FullType(LanguageEntity)])),
      'countryMap',
      serializers.serialize(object.countryMap,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(int), const FullType(CountryEntity)])),
    ];

    return result;
  }

  @override
  StaticState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StaticStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'currencyMap':
          result.currencyMap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(CurrencyEntity)
              ])) as BuiltMap);
          break;
        case 'timezoneMap':
          result.timezoneMap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(TimezoneEntity)
              ])) as BuiltMap);
          break;
        case 'dateFormatMap':
          result.dateFormatMap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(DateFormatEntity)
              ])) as BuiltMap);
          break;
        case 'datetimeFormatMap':
          result.datetimeFormatMap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(DatetimeFormatEntity)
              ])) as BuiltMap);
          break;
        case 'languageMap':
          result.languageMap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(LanguageEntity)
              ])) as BuiltMap);
          break;
        case 'countryMap':
          result.countryMap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(CountryEntity)
              ])) as BuiltMap);
          break;
      }
    }

    return result.build();
  }
}

class _$StaticState extends StaticState {
  @override
  final BuiltMap<int, CurrencyEntity> currencyMap;
  @override
  final BuiltMap<int, TimezoneEntity> timezoneMap;
  @override
  final BuiltMap<int, DateFormatEntity> dateFormatMap;
  @override
  final BuiltMap<int, DatetimeFormatEntity> datetimeFormatMap;
  @override
  final BuiltMap<int, LanguageEntity> languageMap;
  @override
  final BuiltMap<int, CountryEntity> countryMap;

  factory _$StaticState([void updates(StaticStateBuilder b)]) =>
      (new StaticStateBuilder()..update(updates)).build();

  _$StaticState._(
      {this.currencyMap,
      this.timezoneMap,
      this.dateFormatMap,
      this.datetimeFormatMap,
      this.languageMap,
      this.countryMap})
      : super._() {
    if (currencyMap == null) {
      throw new BuiltValueNullFieldError('StaticState', 'currencyMap');
    }
    if (timezoneMap == null) {
      throw new BuiltValueNullFieldError('StaticState', 'timezoneMap');
    }
    if (dateFormatMap == null) {
      throw new BuiltValueNullFieldError('StaticState', 'dateFormatMap');
    }
    if (datetimeFormatMap == null) {
      throw new BuiltValueNullFieldError('StaticState', 'datetimeFormatMap');
    }
    if (languageMap == null) {
      throw new BuiltValueNullFieldError('StaticState', 'languageMap');
    }
    if (countryMap == null) {
      throw new BuiltValueNullFieldError('StaticState', 'countryMap');
    }
  }

  @override
  StaticState rebuild(void updates(StaticStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StaticStateBuilder toBuilder() => new StaticStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StaticState &&
        currencyMap == other.currencyMap &&
        timezoneMap == other.timezoneMap &&
        dateFormatMap == other.dateFormatMap &&
        datetimeFormatMap == other.datetimeFormatMap &&
        languageMap == other.languageMap &&
        countryMap == other.countryMap;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, currencyMap.hashCode), timezoneMap.hashCode),
                    dateFormatMap.hashCode),
                datetimeFormatMap.hashCode),
            languageMap.hashCode),
        countryMap.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StaticState')
          ..add('currencyMap', currencyMap)
          ..add('timezoneMap', timezoneMap)
          ..add('dateFormatMap', dateFormatMap)
          ..add('datetimeFormatMap', datetimeFormatMap)
          ..add('languageMap', languageMap)
          ..add('countryMap', countryMap))
        .toString();
  }
}

class StaticStateBuilder implements Builder<StaticState, StaticStateBuilder> {
  _$StaticState _$v;

  MapBuilder<int, CurrencyEntity> _currencyMap;
  MapBuilder<int, CurrencyEntity> get currencyMap =>
      _$this._currencyMap ??= new MapBuilder<int, CurrencyEntity>();
  set currencyMap(MapBuilder<int, CurrencyEntity> currencyMap) =>
      _$this._currencyMap = currencyMap;

  MapBuilder<int, TimezoneEntity> _timezoneMap;
  MapBuilder<int, TimezoneEntity> get timezoneMap =>
      _$this._timezoneMap ??= new MapBuilder<int, TimezoneEntity>();
  set timezoneMap(MapBuilder<int, TimezoneEntity> timezoneMap) =>
      _$this._timezoneMap = timezoneMap;

  MapBuilder<int, DateFormatEntity> _dateFormatMap;
  MapBuilder<int, DateFormatEntity> get dateFormatMap =>
      _$this._dateFormatMap ??= new MapBuilder<int, DateFormatEntity>();
  set dateFormatMap(MapBuilder<int, DateFormatEntity> dateFormatMap) =>
      _$this._dateFormatMap = dateFormatMap;

  MapBuilder<int, DatetimeFormatEntity> _datetimeFormatMap;
  MapBuilder<int, DatetimeFormatEntity> get datetimeFormatMap =>
      _$this._datetimeFormatMap ??= new MapBuilder<int, DatetimeFormatEntity>();
  set datetimeFormatMap(
          MapBuilder<int, DatetimeFormatEntity> datetimeFormatMap) =>
      _$this._datetimeFormatMap = datetimeFormatMap;

  MapBuilder<int, LanguageEntity> _languageMap;
  MapBuilder<int, LanguageEntity> get languageMap =>
      _$this._languageMap ??= new MapBuilder<int, LanguageEntity>();
  set languageMap(MapBuilder<int, LanguageEntity> languageMap) =>
      _$this._languageMap = languageMap;

  MapBuilder<int, CountryEntity> _countryMap;
  MapBuilder<int, CountryEntity> get countryMap =>
      _$this._countryMap ??= new MapBuilder<int, CountryEntity>();
  set countryMap(MapBuilder<int, CountryEntity> countryMap) =>
      _$this._countryMap = countryMap;

  StaticStateBuilder();

  StaticStateBuilder get _$this {
    if (_$v != null) {
      _currencyMap = _$v.currencyMap?.toBuilder();
      _timezoneMap = _$v.timezoneMap?.toBuilder();
      _dateFormatMap = _$v.dateFormatMap?.toBuilder();
      _datetimeFormatMap = _$v.datetimeFormatMap?.toBuilder();
      _languageMap = _$v.languageMap?.toBuilder();
      _countryMap = _$v.countryMap?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StaticState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StaticState;
  }

  @override
  void update(void updates(StaticStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StaticState build() {
    _$StaticState _$result;
    try {
      _$result = _$v ??
          new _$StaticState._(
              currencyMap: currencyMap.build(),
              timezoneMap: timezoneMap.build(),
              dateFormatMap: dateFormatMap.build(),
              datetimeFormatMap: datetimeFormatMap.build(),
              languageMap: languageMap.build(),
              countryMap: countryMap.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'currencyMap';
        currencyMap.build();
        _$failedField = 'timezoneMap';
        timezoneMap.build();
        _$failedField = 'dateFormatMap';
        dateFormatMap.build();
        _$failedField = 'datetimeFormatMap';
        datetimeFormatMap.build();
        _$failedField = 'languageMap';
        languageMap.build();
        _$failedField = 'countryMap';
        countryMap.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StaticState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
