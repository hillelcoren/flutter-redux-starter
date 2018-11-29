import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

export 'package:flutterreduxrad/data/models/entities.dart';
export 'package:flutterreduxrad/data/models/static/static_data_model.dart';
export 'package:flutterreduxrad/data/models/static/currency_model.dart';
export 'package:flutterreduxrad/data/models/static/timezone_model.dart';
export 'package:flutterreduxrad/data/models/static/date_format_model.dart';
export 'package:flutterreduxrad/data/models/static/datetime_format_model.dart';
export 'package:flutterreduxrad/data/models/static/language_model.dart';
export 'package:flutterreduxrad/data/models/static/country_model.dart';

part 'models.g.dart';

class EntityAction extends EnumClass {

  const EntityAction._(String name) : super(name);

  static Serializer<EntityAction> get serializer => _$entityActionSerializer;

  static const EntityAction archive = _$archive;
  static const EntityAction delete = _$delete;
  static const EntityAction restore = _$restore;
  static const EntityAction clone = _$clone;
  static const EntityAction download = _$download;
  static const EntityAction emailInvoice = _$email;
  static const EntityAction markSent = _$markSent;
  static const EntityAction invoice = _$invoice;
  static const EntityAction pdf = _$pdf;

  static BuiltSet<EntityAction> get values => _$values;
  static EntityAction valueOf(String name) => _$valueOf(name);
}

