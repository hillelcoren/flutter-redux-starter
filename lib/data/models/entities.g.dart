// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

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

const EntityType _$country = const EntityType._('country');
const EntityType _$currency = const EntityType._('currency');
const EntityType _$language = const EntityType._('language');

EntityType _$typeValueOf(String name) {
  switch (name) {
    case 'country':
      return _$country;
    case 'currency':
      return _$currency;
    case 'language':
      return _$language;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EntityType> _$typeValues =
    new BuiltSet<EntityType>(const <EntityType>[
  _$country,
  _$currency,
  _$language,
]);

const EntityState _$active = const EntityState._('active');
const EntityState _$archived = const EntityState._('archived');
const EntityState _$deleted = const EntityState._('deleted');

EntityState _$valueOf(String name) {
  switch (name) {
    case 'active':
      return _$active;
    case 'archived':
      return _$archived;
    case 'deleted':
      return _$deleted;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EntityState> _$values =
    new BuiltSet<EntityState>(const <EntityState>[
  _$active,
  _$archived,
  _$deleted,
]);

Serializer<EntityType> _$entityTypeSerializer = new _$EntityTypeSerializer();
Serializer<EntityState> _$entityStateSerializer = new _$EntityStateSerializer();
Serializer<ErrorMessage> _$errorMessageSerializer =
    new _$ErrorMessageSerializer();
Serializer<LoginResponse> _$loginResponseSerializer =
    new _$LoginResponseSerializer();
Serializer<LoginResponseData> _$loginResponseDataSerializer =
    new _$LoginResponseDataSerializer();
Serializer<StaticData> _$staticDataSerializer = new _$StaticDataSerializer();
Serializer<DashboardResponse> _$dashboardResponseSerializer =
    new _$DashboardResponseSerializer();
Serializer<DashboardEntity> _$dashboardEntitySerializer =
    new _$DashboardEntitySerializer();
Serializer<ActivityEntity> _$activityEntitySerializer =
    new _$ActivityEntitySerializer();

class _$EntityTypeSerializer implements PrimitiveSerializer<EntityType> {
  @override
  final Iterable<Type> types = const <Type>[EntityType];
  @override
  final String wireName = 'EntityType';

  @override
  Object serialize(Serializers serializers, EntityType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  EntityType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EntityType.valueOf(serialized as String);
}

class _$EntityStateSerializer implements PrimitiveSerializer<EntityState> {
  @override
  final Iterable<Type> types = const <Type>[EntityState];
  @override
  final String wireName = 'EntityState';

  @override
  Object serialize(Serializers serializers, EntityState object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  EntityState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EntityState.valueOf(serialized as String);
}

class _$ErrorMessageSerializer implements StructuredSerializer<ErrorMessage> {
  @override
  final Iterable<Type> types = const [ErrorMessage, _$ErrorMessage];
  @override
  final String wireName = 'ErrorMessage';

  @override
  Iterable serialize(Serializers serializers, ErrorMessage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ErrorMessage deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ErrorMessageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginResponseSerializer implements StructuredSerializer<LoginResponse> {
  @override
  final Iterable<Type> types = const [LoginResponse, _$LoginResponse];
  @override
  final String wireName = 'LoginResponse';

  @override
  Iterable serialize(Serializers serializers, LoginResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(LoginResponseData)),
    ];
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(ErrorMessage)));
    }

    return result;
  }

  @override
  LoginResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(LoginResponseData))
              as LoginResponseData);
          break;
        case 'error':
          result.error.replace(serializers.deserialize(value,
              specifiedType: const FullType(ErrorMessage)) as ErrorMessage);
          break;
      }
    }

    return result.build();
  }
}

class _$LoginResponseDataSerializer
    implements StructuredSerializer<LoginResponseData> {
  @override
  final Iterable<Type> types = const [LoginResponseData, _$LoginResponseData];
  @override
  final String wireName = 'LoginResponseData';

  @override
  Iterable serialize(Serializers serializers, LoginResponseData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'version',
      serializers.serialize(object.version,
          specifiedType: const FullType(String)),
      'static',
      serializers.serialize(object.static,
          specifiedType: const FullType(StaticData)),
    ];

    return result;
  }

  @override
  LoginResponseData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginResponseDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'static':
          result.static.replace(serializers.deserialize(value,
              specifiedType: const FullType(StaticData)) as StaticData);
          break;
      }
    }

    return result.build();
  }
}

class _$StaticDataSerializer implements StructuredSerializer<StaticData> {
  @override
  final Iterable<Type> types = const [StaticData, _$StaticData];
  @override
  final String wireName = 'StaticData';

  @override
  Iterable serialize(Serializers serializers, StaticData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'currencies',
      serializers.serialize(object.currencies,
          specifiedType: const FullType(
              BuiltList, const [const FullType(CurrencyEntity)])),
      'timezones',
      serializers.serialize(object.timezones,
          specifiedType: const FullType(
              BuiltList, const [const FullType(TimezoneEntity)])),
      'dateFormats',
      serializers.serialize(object.dateFormats,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DateFormatEntity)])),
      'datetimeFormats',
      serializers.serialize(object.datetimeFormats,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DatetimeFormatEntity)])),
      'languages',
      serializers.serialize(object.languages,
          specifiedType: const FullType(
              BuiltList, const [const FullType(LanguageEntity)])),
      'countries',
      serializers.serialize(object.countries,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CountryEntity)])),
    ];

    return result;
  }

  @override
  StaticData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StaticDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'currencies':
          result.currencies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CurrencyEntity)]))
              as BuiltList);
          break;
        case 'timezones':
          result.timezones.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TimezoneEntity)]))
              as BuiltList);
          break;
        case 'dateFormats':
          result.dateFormats.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateFormatEntity)]))
              as BuiltList);
          break;
        case 'datetimeFormats':
          result.datetimeFormats.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DatetimeFormatEntity)]))
              as BuiltList);
          break;
        case 'languages':
          result.languages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(LanguageEntity)]))
              as BuiltList);
          break;
        case 'countries':
          result.countries.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CountryEntity)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$DashboardResponseSerializer
    implements StructuredSerializer<DashboardResponse> {
  @override
  final Iterable<Type> types = const [DashboardResponse, _$DashboardResponse];
  @override
  final String wireName = 'DashboardResponse';

  @override
  Iterable serialize(Serializers serializers, DashboardResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(DashboardEntity)),
    ];

    return result;
  }

  @override
  DashboardResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DashboardResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DashboardEntity))
              as DashboardEntity);
          break;
      }
    }

    return result.build();
  }
}

class _$DashboardEntitySerializer
    implements StructuredSerializer<DashboardEntity> {
  @override
  final Iterable<Type> types = const [DashboardEntity, _$DashboardEntity];
  @override
  final String wireName = 'DashboardEntity';

  @override
  Iterable serialize(Serializers serializers, DashboardEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'activities',
      serializers.serialize(object.activities,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ActivityEntity)])),
    ];
    if (object.paidToDate != null) {
      result
        ..add('paidToDate')
        ..add(serializers.serialize(object.paidToDate,
            specifiedType: const FullType(double)));
    }
    if (object.paidToDateCurrency != null) {
      result
        ..add('paidToDateCurrency')
        ..add(serializers.serialize(object.paidToDateCurrency,
            specifiedType: const FullType(int)));
    }
    if (object.balances != null) {
      result
        ..add('balances')
        ..add(serializers.serialize(object.balances,
            specifiedType: const FullType(double)));
    }
    if (object.balancesCurrency != null) {
      result
        ..add('balancesCurrency')
        ..add(serializers.serialize(object.balancesCurrency,
            specifiedType: const FullType(int)));
    }
    if (object.averageInvoice != null) {
      result
        ..add('averageInvoice')
        ..add(serializers.serialize(object.averageInvoice,
            specifiedType: const FullType(double)));
    }
    if (object.averageInvoiceCurrency != null) {
      result
        ..add('averageInvoiceCurrency')
        ..add(serializers.serialize(object.averageInvoiceCurrency,
            specifiedType: const FullType(int)));
    }
    if (object.invoicesSent != null) {
      result
        ..add('invoicesSent')
        ..add(serializers.serialize(object.invoicesSent,
            specifiedType: const FullType(int)));
    }
    if (object.activeClients != null) {
      result
        ..add('activeClients')
        ..add(serializers.serialize(object.activeClients,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  DashboardEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DashboardEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'paidToDate':
          result.paidToDate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'paidToDateCurrency':
          result.paidToDateCurrency = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'balances':
          result.balances = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'balancesCurrency':
          result.balancesCurrency = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'averageInvoice':
          result.averageInvoice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'averageInvoiceCurrency':
          result.averageInvoiceCurrency = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'invoicesSent':
          result.invoicesSent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'activeClients':
          result.activeClients = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'activities':
          result.activities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ActivityEntity)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$ActivityEntitySerializer
    implements StructuredSerializer<ActivityEntity> {
  @override
  final Iterable<Type> types = const [ActivityEntity, _$ActivityEntity];
  @override
  final String wireName = 'ActivityEntity';

  @override
  Iterable serialize(Serializers serializers, ActivityEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
      'activity_type_id',
      serializers.serialize(object.activityTypeId,
          specifiedType: const FullType(int)),
      'user_id',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(int)),
    ];
    if (object.clientId != null) {
      result
        ..add('client_id')
        ..add(serializers.serialize(object.clientId,
            specifiedType: const FullType(int)));
    }
    if (object.invoiceId != null) {
      result
        ..add('invoice_id')
        ..add(serializers.serialize(object.invoiceId,
            specifiedType: const FullType(int)));
    }
    if (object.paymentId != null) {
      result
        ..add('payment_id')
        ..add(serializers.serialize(object.paymentId,
            specifiedType: const FullType(int)));
    }
    if (object.creditId != null) {
      result
        ..add('credit_id')
        ..add(serializers.serialize(object.creditId,
            specifiedType: const FullType(int)));
    }
    if (object.expenseId != null) {
      result
        ..add('expense_id')
        ..add(serializers.serialize(object.expenseId,
            specifiedType: const FullType(int)));
    }
    if (object.isSystem != null) {
      result
        ..add('is_system')
        ..add(serializers.serialize(object.isSystem,
            specifiedType: const FullType(bool)));
    }
    if (object.contactId != null) {
      result
        ..add('contact_id')
        ..add(serializers.serialize(object.contactId,
            specifiedType: const FullType(int)));
    }
    if (object.taskId != null) {
      result
        ..add('task_id')
        ..add(serializers.serialize(object.taskId,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  ActivityEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'activity_type_id':
          result.activityTypeId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'client_id':
          result.clientId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'invoice_id':
          result.invoiceId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'payment_id':
          result.paymentId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'credit_id':
          result.creditId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'expense_id':
          result.expenseId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'is_system':
          result.isSystem = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'contact_id':
          result.contactId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'task_id':
          result.taskId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorMessage extends ErrorMessage {
  @override
  final String message;

  factory _$ErrorMessage([void updates(ErrorMessageBuilder b)]) =>
      (new ErrorMessageBuilder()..update(updates)).build();

  _$ErrorMessage._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('ErrorMessage', 'message');
    }
  }

  @override
  ErrorMessage rebuild(void updates(ErrorMessageBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorMessageBuilder toBuilder() => new ErrorMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorMessage && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ErrorMessage')
          ..add('message', message))
        .toString();
  }
}

class ErrorMessageBuilder
    implements Builder<ErrorMessage, ErrorMessageBuilder> {
  _$ErrorMessage _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ErrorMessageBuilder();

  ErrorMessageBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorMessage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ErrorMessage;
  }

  @override
  void update(void updates(ErrorMessageBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ErrorMessage build() {
    final _$result = _$v ?? new _$ErrorMessage._(message: message);
    replace(_$result);
    return _$result;
  }
}

class _$LoginResponse extends LoginResponse {
  @override
  final LoginResponseData data;
  @override
  final ErrorMessage error;

  factory _$LoginResponse([void updates(LoginResponseBuilder b)]) =>
      (new LoginResponseBuilder()..update(updates)).build();

  _$LoginResponse._({this.data, this.error}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('LoginResponse', 'data');
    }
  }

  @override
  LoginResponse rebuild(void updates(LoginResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginResponseBuilder toBuilder() => new LoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginResponse && data == other.data && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, data.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginResponse')
          ..add('data', data)
          ..add('error', error))
        .toString();
  }
}

class LoginResponseBuilder
    implements Builder<LoginResponse, LoginResponseBuilder> {
  _$LoginResponse _$v;

  LoginResponseDataBuilder _data;
  LoginResponseDataBuilder get data =>
      _$this._data ??= new LoginResponseDataBuilder();
  set data(LoginResponseDataBuilder data) => _$this._data = data;

  ErrorMessageBuilder _error;
  ErrorMessageBuilder get error => _$this._error ??= new ErrorMessageBuilder();
  set error(ErrorMessageBuilder error) => _$this._error = error;

  LoginResponseBuilder();

  LoginResponseBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _error = _$v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginResponse;
  }

  @override
  void update(void updates(LoginResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginResponse build() {
    _$LoginResponse _$result;
    try {
      _$result = _$v ??
          new _$LoginResponse._(data: data.build(), error: _error?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LoginResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$LoginResponseData extends LoginResponseData {
  @override
  final String version;
  @override
  final StaticData static;

  factory _$LoginResponseData([void updates(LoginResponseDataBuilder b)]) =>
      (new LoginResponseDataBuilder()..update(updates)).build();

  _$LoginResponseData._({this.version, this.static}) : super._() {
    if (version == null) {
      throw new BuiltValueNullFieldError('LoginResponseData', 'version');
    }
    if (static == null) {
      throw new BuiltValueNullFieldError('LoginResponseData', 'static');
    }
  }

  @override
  LoginResponseData rebuild(void updates(LoginResponseDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginResponseDataBuilder toBuilder() =>
      new LoginResponseDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginResponseData &&
        version == other.version &&
        static == other.static;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, version.hashCode), static.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginResponseData')
          ..add('version', version)
          ..add('static', static))
        .toString();
  }
}

class LoginResponseDataBuilder
    implements Builder<LoginResponseData, LoginResponseDataBuilder> {
  _$LoginResponseData _$v;

  String _version;
  String get version => _$this._version;
  set version(String version) => _$this._version = version;

  StaticDataBuilder _static;
  StaticDataBuilder get static => _$this._static ??= new StaticDataBuilder();
  set static(StaticDataBuilder static) => _$this._static = static;

  LoginResponseDataBuilder();

  LoginResponseDataBuilder get _$this {
    if (_$v != null) {
      _version = _$v.version;
      _static = _$v.static?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginResponseData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginResponseData;
  }

  @override
  void update(void updates(LoginResponseDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginResponseData build() {
    _$LoginResponseData _$result;
    try {
      _$result = _$v ??
          new _$LoginResponseData._(version: version, static: static.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'static';
        static.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LoginResponseData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$StaticData extends StaticData {
  @override
  final BuiltList<CurrencyEntity> currencies;
  @override
  final BuiltList<TimezoneEntity> timezones;
  @override
  final BuiltList<DateFormatEntity> dateFormats;
  @override
  final BuiltList<DatetimeFormatEntity> datetimeFormats;
  @override
  final BuiltList<LanguageEntity> languages;
  @override
  final BuiltList<CountryEntity> countries;

  factory _$StaticData([void updates(StaticDataBuilder b)]) =>
      (new StaticDataBuilder()..update(updates)).build();

  _$StaticData._(
      {this.currencies,
      this.timezones,
      this.dateFormats,
      this.datetimeFormats,
      this.languages,
      this.countries})
      : super._() {
    if (currencies == null) {
      throw new BuiltValueNullFieldError('StaticData', 'currencies');
    }
    if (timezones == null) {
      throw new BuiltValueNullFieldError('StaticData', 'timezones');
    }
    if (dateFormats == null) {
      throw new BuiltValueNullFieldError('StaticData', 'dateFormats');
    }
    if (datetimeFormats == null) {
      throw new BuiltValueNullFieldError('StaticData', 'datetimeFormats');
    }
    if (languages == null) {
      throw new BuiltValueNullFieldError('StaticData', 'languages');
    }
    if (countries == null) {
      throw new BuiltValueNullFieldError('StaticData', 'countries');
    }
  }

  @override
  StaticData rebuild(void updates(StaticDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StaticDataBuilder toBuilder() => new StaticDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StaticData &&
        currencies == other.currencies &&
        timezones == other.timezones &&
        dateFormats == other.dateFormats &&
        datetimeFormats == other.datetimeFormats &&
        languages == other.languages &&
        countries == other.countries;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, currencies.hashCode), timezones.hashCode),
                    dateFormats.hashCode),
                datetimeFormats.hashCode),
            languages.hashCode),
        countries.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StaticData')
          ..add('currencies', currencies)
          ..add('timezones', timezones)
          ..add('dateFormats', dateFormats)
          ..add('datetimeFormats', datetimeFormats)
          ..add('languages', languages)
          ..add('countries', countries))
        .toString();
  }
}

class StaticDataBuilder implements Builder<StaticData, StaticDataBuilder> {
  _$StaticData _$v;

  ListBuilder<CurrencyEntity> _currencies;
  ListBuilder<CurrencyEntity> get currencies =>
      _$this._currencies ??= new ListBuilder<CurrencyEntity>();
  set currencies(ListBuilder<CurrencyEntity> currencies) =>
      _$this._currencies = currencies;

  ListBuilder<TimezoneEntity> _timezones;
  ListBuilder<TimezoneEntity> get timezones =>
      _$this._timezones ??= new ListBuilder<TimezoneEntity>();
  set timezones(ListBuilder<TimezoneEntity> timezones) =>
      _$this._timezones = timezones;

  ListBuilder<DateFormatEntity> _dateFormats;
  ListBuilder<DateFormatEntity> get dateFormats =>
      _$this._dateFormats ??= new ListBuilder<DateFormatEntity>();
  set dateFormats(ListBuilder<DateFormatEntity> dateFormats) =>
      _$this._dateFormats = dateFormats;

  ListBuilder<DatetimeFormatEntity> _datetimeFormats;
  ListBuilder<DatetimeFormatEntity> get datetimeFormats =>
      _$this._datetimeFormats ??= new ListBuilder<DatetimeFormatEntity>();
  set datetimeFormats(ListBuilder<DatetimeFormatEntity> datetimeFormats) =>
      _$this._datetimeFormats = datetimeFormats;

  ListBuilder<LanguageEntity> _languages;
  ListBuilder<LanguageEntity> get languages =>
      _$this._languages ??= new ListBuilder<LanguageEntity>();
  set languages(ListBuilder<LanguageEntity> languages) =>
      _$this._languages = languages;

  ListBuilder<CountryEntity> _countries;
  ListBuilder<CountryEntity> get countries =>
      _$this._countries ??= new ListBuilder<CountryEntity>();
  set countries(ListBuilder<CountryEntity> countries) =>
      _$this._countries = countries;

  StaticDataBuilder();

  StaticDataBuilder get _$this {
    if (_$v != null) {
      _currencies = _$v.currencies?.toBuilder();
      _timezones = _$v.timezones?.toBuilder();
      _dateFormats = _$v.dateFormats?.toBuilder();
      _datetimeFormats = _$v.datetimeFormats?.toBuilder();
      _languages = _$v.languages?.toBuilder();
      _countries = _$v.countries?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StaticData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StaticData;
  }

  @override
  void update(void updates(StaticDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StaticData build() {
    _$StaticData _$result;
    try {
      _$result = _$v ??
          new _$StaticData._(
              currencies: currencies.build(),
              timezones: timezones.build(),
              dateFormats: dateFormats.build(),
              datetimeFormats: datetimeFormats.build(),
              languages: languages.build(),
              countries: countries.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'currencies';
        currencies.build();
        _$failedField = 'timezones';
        timezones.build();
        _$failedField = 'dateFormats';
        dateFormats.build();
        _$failedField = 'datetimeFormats';
        datetimeFormats.build();
        _$failedField = 'languages';
        languages.build();
        _$failedField = 'countries';
        countries.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StaticData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DashboardResponse extends DashboardResponse {
  @override
  final DashboardEntity data;

  factory _$DashboardResponse([void updates(DashboardResponseBuilder b)]) =>
      (new DashboardResponseBuilder()..update(updates)).build();

  _$DashboardResponse._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('DashboardResponse', 'data');
    }
  }

  @override
  DashboardResponse rebuild(void updates(DashboardResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardResponseBuilder toBuilder() =>
      new DashboardResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardResponse && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DashboardResponse')..add('data', data))
        .toString();
  }
}

class DashboardResponseBuilder
    implements Builder<DashboardResponse, DashboardResponseBuilder> {
  _$DashboardResponse _$v;

  DashboardEntityBuilder _data;
  DashboardEntityBuilder get data =>
      _$this._data ??= new DashboardEntityBuilder();
  set data(DashboardEntityBuilder data) => _$this._data = data;

  DashboardResponseBuilder();

  DashboardResponseBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DashboardResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DashboardResponse;
  }

  @override
  void update(void updates(DashboardResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DashboardResponse build() {
    _$DashboardResponse _$result;
    try {
      _$result = _$v ?? new _$DashboardResponse._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DashboardResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DashboardEntity extends DashboardEntity {
  @override
  final double paidToDate;
  @override
  final int paidToDateCurrency;
  @override
  final double balances;
  @override
  final int balancesCurrency;
  @override
  final double averageInvoice;
  @override
  final int averageInvoiceCurrency;
  @override
  final int invoicesSent;
  @override
  final int activeClients;
  @override
  final BuiltList<ActivityEntity> activities;

  factory _$DashboardEntity([void updates(DashboardEntityBuilder b)]) =>
      (new DashboardEntityBuilder()..update(updates)).build();

  _$DashboardEntity._(
      {this.paidToDate,
      this.paidToDateCurrency,
      this.balances,
      this.balancesCurrency,
      this.averageInvoice,
      this.averageInvoiceCurrency,
      this.invoicesSent,
      this.activeClients,
      this.activities})
      : super._() {
    if (activities == null) {
      throw new BuiltValueNullFieldError('DashboardEntity', 'activities');
    }
  }

  @override
  DashboardEntity rebuild(void updates(DashboardEntityBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardEntityBuilder toBuilder() =>
      new DashboardEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardEntity &&
        paidToDate == other.paidToDate &&
        paidToDateCurrency == other.paidToDateCurrency &&
        balances == other.balances &&
        balancesCurrency == other.balancesCurrency &&
        averageInvoice == other.averageInvoice &&
        averageInvoiceCurrency == other.averageInvoiceCurrency &&
        invoicesSent == other.invoicesSent &&
        activeClients == other.activeClients &&
        activities == other.activities;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, paidToDate.hashCode),
                                    paidToDateCurrency.hashCode),
                                balances.hashCode),
                            balancesCurrency.hashCode),
                        averageInvoice.hashCode),
                    averageInvoiceCurrency.hashCode),
                invoicesSent.hashCode),
            activeClients.hashCode),
        activities.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DashboardEntity')
          ..add('paidToDate', paidToDate)
          ..add('paidToDateCurrency', paidToDateCurrency)
          ..add('balances', balances)
          ..add('balancesCurrency', balancesCurrency)
          ..add('averageInvoice', averageInvoice)
          ..add('averageInvoiceCurrency', averageInvoiceCurrency)
          ..add('invoicesSent', invoicesSent)
          ..add('activeClients', activeClients)
          ..add('activities', activities))
        .toString();
  }
}

class DashboardEntityBuilder
    implements Builder<DashboardEntity, DashboardEntityBuilder> {
  _$DashboardEntity _$v;

  double _paidToDate;
  double get paidToDate => _$this._paidToDate;
  set paidToDate(double paidToDate) => _$this._paidToDate = paidToDate;

  int _paidToDateCurrency;
  int get paidToDateCurrency => _$this._paidToDateCurrency;
  set paidToDateCurrency(int paidToDateCurrency) =>
      _$this._paidToDateCurrency = paidToDateCurrency;

  double _balances;
  double get balances => _$this._balances;
  set balances(double balances) => _$this._balances = balances;

  int _balancesCurrency;
  int get balancesCurrency => _$this._balancesCurrency;
  set balancesCurrency(int balancesCurrency) =>
      _$this._balancesCurrency = balancesCurrency;

  double _averageInvoice;
  double get averageInvoice => _$this._averageInvoice;
  set averageInvoice(double averageInvoice) =>
      _$this._averageInvoice = averageInvoice;

  int _averageInvoiceCurrency;
  int get averageInvoiceCurrency => _$this._averageInvoiceCurrency;
  set averageInvoiceCurrency(int averageInvoiceCurrency) =>
      _$this._averageInvoiceCurrency = averageInvoiceCurrency;

  int _invoicesSent;
  int get invoicesSent => _$this._invoicesSent;
  set invoicesSent(int invoicesSent) => _$this._invoicesSent = invoicesSent;

  int _activeClients;
  int get activeClients => _$this._activeClients;
  set activeClients(int activeClients) => _$this._activeClients = activeClients;

  ListBuilder<ActivityEntity> _activities;
  ListBuilder<ActivityEntity> get activities =>
      _$this._activities ??= new ListBuilder<ActivityEntity>();
  set activities(ListBuilder<ActivityEntity> activities) =>
      _$this._activities = activities;

  DashboardEntityBuilder();

  DashboardEntityBuilder get _$this {
    if (_$v != null) {
      _paidToDate = _$v.paidToDate;
      _paidToDateCurrency = _$v.paidToDateCurrency;
      _balances = _$v.balances;
      _balancesCurrency = _$v.balancesCurrency;
      _averageInvoice = _$v.averageInvoice;
      _averageInvoiceCurrency = _$v.averageInvoiceCurrency;
      _invoicesSent = _$v.invoicesSent;
      _activeClients = _$v.activeClients;
      _activities = _$v.activities?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DashboardEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DashboardEntity;
  }

  @override
  void update(void updates(DashboardEntityBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DashboardEntity build() {
    _$DashboardEntity _$result;
    try {
      _$result = _$v ??
          new _$DashboardEntity._(
              paidToDate: paidToDate,
              paidToDateCurrency: paidToDateCurrency,
              balances: balances,
              balancesCurrency: balancesCurrency,
              averageInvoice: averageInvoice,
              averageInvoiceCurrency: averageInvoiceCurrency,
              invoicesSent: invoicesSent,
              activeClients: activeClients,
              activities: activities.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activities';
        activities.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DashboardEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ActivityEntity extends ActivityEntity {
  @override
  final String key;
  @override
  final int activityTypeId;
  @override
  final int clientId;
  @override
  final int userId;
  @override
  final int invoiceId;
  @override
  final int paymentId;
  @override
  final int creditId;
  @override
  final int updatedAt;
  @override
  final int expenseId;
  @override
  final bool isSystem;
  @override
  final int contactId;
  @override
  final int taskId;

  factory _$ActivityEntity([void updates(ActivityEntityBuilder b)]) =>
      (new ActivityEntityBuilder()..update(updates)).build();

  _$ActivityEntity._(
      {this.key,
      this.activityTypeId,
      this.clientId,
      this.userId,
      this.invoiceId,
      this.paymentId,
      this.creditId,
      this.updatedAt,
      this.expenseId,
      this.isSystem,
      this.contactId,
      this.taskId})
      : super._() {
    if (key == null) {
      throw new BuiltValueNullFieldError('ActivityEntity', 'key');
    }
    if (activityTypeId == null) {
      throw new BuiltValueNullFieldError('ActivityEntity', 'activityTypeId');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('ActivityEntity', 'userId');
    }
    if (updatedAt == null) {
      throw new BuiltValueNullFieldError('ActivityEntity', 'updatedAt');
    }
  }

  @override
  ActivityEntity rebuild(void updates(ActivityEntityBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityEntityBuilder toBuilder() =>
      new ActivityEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityEntity &&
        key == other.key &&
        activityTypeId == other.activityTypeId &&
        clientId == other.clientId &&
        userId == other.userId &&
        invoiceId == other.invoiceId &&
        paymentId == other.paymentId &&
        creditId == other.creditId &&
        updatedAt == other.updatedAt &&
        expenseId == other.expenseId &&
        isSystem == other.isSystem &&
        contactId == other.contactId &&
        taskId == other.taskId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, key.hashCode),
                                                activityTypeId.hashCode),
                                            clientId.hashCode),
                                        userId.hashCode),
                                    invoiceId.hashCode),
                                paymentId.hashCode),
                            creditId.hashCode),
                        updatedAt.hashCode),
                    expenseId.hashCode),
                isSystem.hashCode),
            contactId.hashCode),
        taskId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActivityEntity')
          ..add('key', key)
          ..add('activityTypeId', activityTypeId)
          ..add('clientId', clientId)
          ..add('userId', userId)
          ..add('invoiceId', invoiceId)
          ..add('paymentId', paymentId)
          ..add('creditId', creditId)
          ..add('updatedAt', updatedAt)
          ..add('expenseId', expenseId)
          ..add('isSystem', isSystem)
          ..add('contactId', contactId)
          ..add('taskId', taskId))
        .toString();
  }
}

class ActivityEntityBuilder
    implements Builder<ActivityEntity, ActivityEntityBuilder> {
  _$ActivityEntity _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  int _activityTypeId;
  int get activityTypeId => _$this._activityTypeId;
  set activityTypeId(int activityTypeId) =>
      _$this._activityTypeId = activityTypeId;

  int _clientId;
  int get clientId => _$this._clientId;
  set clientId(int clientId) => _$this._clientId = clientId;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  int _invoiceId;
  int get invoiceId => _$this._invoiceId;
  set invoiceId(int invoiceId) => _$this._invoiceId = invoiceId;

  int _paymentId;
  int get paymentId => _$this._paymentId;
  set paymentId(int paymentId) => _$this._paymentId = paymentId;

  int _creditId;
  int get creditId => _$this._creditId;
  set creditId(int creditId) => _$this._creditId = creditId;

  int _updatedAt;
  int get updatedAt => _$this._updatedAt;
  set updatedAt(int updatedAt) => _$this._updatedAt = updatedAt;

  int _expenseId;
  int get expenseId => _$this._expenseId;
  set expenseId(int expenseId) => _$this._expenseId = expenseId;

  bool _isSystem;
  bool get isSystem => _$this._isSystem;
  set isSystem(bool isSystem) => _$this._isSystem = isSystem;

  int _contactId;
  int get contactId => _$this._contactId;
  set contactId(int contactId) => _$this._contactId = contactId;

  int _taskId;
  int get taskId => _$this._taskId;
  set taskId(int taskId) => _$this._taskId = taskId;

  ActivityEntityBuilder();

  ActivityEntityBuilder get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _activityTypeId = _$v.activityTypeId;
      _clientId = _$v.clientId;
      _userId = _$v.userId;
      _invoiceId = _$v.invoiceId;
      _paymentId = _$v.paymentId;
      _creditId = _$v.creditId;
      _updatedAt = _$v.updatedAt;
      _expenseId = _$v.expenseId;
      _isSystem = _$v.isSystem;
      _contactId = _$v.contactId;
      _taskId = _$v.taskId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ActivityEntity;
  }

  @override
  void update(void updates(ActivityEntityBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ActivityEntity build() {
    final _$result = _$v ??
        new _$ActivityEntity._(
            key: key,
            activityTypeId: activityTypeId,
            clientId: clientId,
            userId: userId,
            invoiceId: invoiceId,
            paymentId: paymentId,
            creditId: creditId,
            updatedAt: updatedAt,
            expenseId: expenseId,
            isSystem: isSystem,
            contactId: contactId,
            taskId: taskId);
    replace(_$result);
    return _$result;
  }
}
