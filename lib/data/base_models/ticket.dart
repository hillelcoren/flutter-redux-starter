import 'package:built_value/built_value.dart';
import 'package:flutterreduxrad/data/base_models/price.dart';
import 'package:flutterreduxrad/data/base_models/availability.dart';
import 'package:flutterreduxrad/data/models_metadata/firebase_config.dart';
import 'package:flutterreduxrad/data/models_metadata/include_fields.dart';
import 'package:flutterreduxrad/data/models_metadata/field_metadata.dart';

@FirebaseConfig('ticket', '')
class Ticket {

  String ticketName;

  String ticketType;

  @nullable
  String ticketTag;

  @IncludedFields({'priceMicros': 'int', 'currencyCode': 'String'})
  Price price;

  @nullable
  @FieldMetadata({'fieldType': FormFieldType.textarea})
  String longDescription;

  @nullable
  String shortDescription;

  @nullable
  @IncludedFields({'startDate': 'String', 'endDate': 'String'})
  Availability ticketAvailability;
}