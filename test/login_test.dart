import 'package:flutter_redux_starter/keys.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

// Rename .env.dart.example to .env.dart
import '../.env.dart';

void main() {
  group('LOGIN TEST', () {

    FlutterDriver driver;
    String loginEmail, loginPassword;

    setUp(() async {
      driver = await FlutterDriver.connect();

      // read config file
      loginEmail = Config.LOGIN_EMAIL;
      loginPassword = Config.LOGIN_PASSWORD;
    });

    tearDown(() async {
      if(driver!=null) {
        driver.close();
      }
    });

    test('No input provided by user test', () async {
      await driver.tap(find.text('LOGIN'));
      await driver.waitFor(find.text('Please enter your email'));
      await driver.waitFor(find.text('Please enter your password'));
    });

    test('Details filled by user and login', () async {

      await driver.tap(find.byValueKey(LoginKeys.emailKey));
      await driver.enterText(loginEmail);

      await driver.tap(find.byValueKey(LoginKeys.passwordKey));
      await driver.enterText(loginPassword);

      await driver.tap(find.text('LOGIN'));

      //await driver.waitFor(find.byType(''));
    });
  });
}