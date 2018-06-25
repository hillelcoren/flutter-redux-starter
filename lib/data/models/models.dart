import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'models.g.dart';

class EntityType extends EnumClass {
  static Serializer<EntityType> get serializer => _$entityTypeSerializer;

  // STARTER: types - do not remove comment

  const EntityType._(String name) : super(name);

  String get plural {
    // TODO improve implementation
    return this.toString() + 's';
  }

  static BuiltSet<EntityType> get values => _$typeValues;
  static EntityType valueOf(String name) => _$typeValueOf(name);
}

class EntityAction extends EnumClass {
  static Serializer<EntityAction> get serializer => _$entityActionSerializer;

  static const EntityAction delete = _$delete;

  const EntityAction._(String name) : super(name);

  static BuiltSet<EntityAction> get values => _$values;
  static EntityAction valueOf(String name) => _$valueOf(name);
}

abstract class BaseEntity {

  int get id;

  String get listDisplayName {
    return 'Error: not set';
  }

  bool matchesSearch(String search) {
    return true;
  }

  String matchesSearchField(String search) {
    return null;
  }

  String matchesSearchValue(String search) {
    return null;
  }

  bool get isNew {
    return this.id == null || this.id <= 0;
  }

  bool get isActive {
    return true;
  }

  bool get isDeleted {
    return false;
  }

}


abstract class LoginResponse implements Built<LoginResponse, LoginResponseBuilder> {

  BuiltList<dynamic> get data;

  LoginResponse._();
  factory LoginResponse([updates(LoginResponseBuilder b)]) = _$LoginResponse;
  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
}
