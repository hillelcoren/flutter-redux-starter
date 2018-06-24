// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable serialize(Serializers serializers, AppState object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
      'authState',
      serializers.serialize(object.authState,
          specifiedType: const FullType(AuthState)),
      'uiState',
      serializers.serialize(object.uiState,
          specifiedType: const FullType(UIState)),
      'dataState',
      serializers.serialize(object.dataState,
          specifiedType: const FullType(DataState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'authState':
          result.authState.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthState)) as AuthState);
          break;
        case 'uiState':
          result.uiState.replace(serializers.deserialize(value,
              specifiedType: const FullType(UIState)) as UIState);
          break;
        case 'dataState':
          result.dataState.replace(serializers.deserialize(value,
              specifiedType: const FullType(DataState)) as DataState);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final bool isLoading;
  @override
  final AuthState authState;
  @override
  final UIState uiState;
  @override
  final DataState dataState;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.isLoading, this.authState, this.uiState, this.dataState})
      : super._() {
    if (isLoading == null)
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
    if (authState == null)
      throw new BuiltValueNullFieldError('AppState', 'authState');
    if (uiState == null)
      throw new BuiltValueNullFieldError('AppState', 'uiState');
    if (dataState == null)
      throw new BuiltValueNullFieldError('AppState', 'dataState');
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! AppState) return false;
    return isLoading == other.isLoading &&
        authState == other.authState &&
        uiState == other.uiState &&
        dataState == other.dataState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), authState.hashCode),
            uiState.hashCode),
        dataState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('isLoading', isLoading)
          ..add('authState', authState)
          ..add('uiState', uiState)
          ..add('dataState', dataState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  AuthStateBuilder _authState;
  AuthStateBuilder get authState =>
      _$this._authState ??= new AuthStateBuilder();
  set authState(AuthStateBuilder authState) => _$this._authState = authState;

  UIStateBuilder _uiState;
  UIStateBuilder get uiState => _$this._uiState ??= new UIStateBuilder();
  set uiState(UIStateBuilder uiState) => _$this._uiState = uiState;

  DataStateBuilder _dataState;
  DataStateBuilder get dataState =>
      _$this._dataState ??= new DataStateBuilder();
  set dataState(DataStateBuilder dataState) => _$this._dataState = dataState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _authState = _$v.authState?.toBuilder();
      _uiState = _$v.uiState?.toBuilder();
      _dataState = _$v.dataState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              isLoading: isLoading,
              authState: authState.build(),
              uiState: uiState.build(),
              dataState: dataState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'authState';
        authState.build();
        _$failedField = 'uiState';
        uiState.build();
        _$failedField = 'dataState';
        dataState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
