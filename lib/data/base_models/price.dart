
import 'package:flutterreduxrad/data/models_metadata/firebase_config.dart';

@FirebaseConfig('price', 'redux-rad')
class Price {

  int priceMicros;

  String currencyCode;

  String priceOptionTag;

}