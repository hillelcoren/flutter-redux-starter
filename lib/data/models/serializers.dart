import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutterreduxrad/data/models/entities.dart';
import 'package:flutterreduxrad/data/models/models.dart';
import 'package:flutterreduxrad/redux/app/app_state.dart';
import 'package:flutterreduxrad/redux/app/data_state.dart';
import 'package:flutterreduxrad/redux/auth/auth_state.dart';
import 'package:flutterreduxrad/redux/static/static_state.dart';
import 'package:flutterreduxrad/redux/ui/ui_state.dart';
import 'package:flutterreduxrad/redux/ui/list_ui_state.dart';
import 'package:built_collection/built_collection.dart';

// STARTER: import - do not remove comment


part 'serializers.g.dart';

@SerializersFor(const [
  AppState,
  LoginResponse,
  DashboardResponse,
  StaticDataItemResponse,
  CountryItemResponse,
  CountryListResponse,
  CurrencyItemResponse,
  CurrencyListResponse,
  DateFormatItemResponse,
  DateFormatListResponse,
  DatetimeFormatItemResponse,
  DatetimeFormatListResponse,
  LanguageItemResponse,
  LanguageListResponse,
  TimezoneItemResponse,
  TimezoneListResponse,

  // STARTER: serializers - do not remove comment
  
])
final Serializers serializers =
(_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();