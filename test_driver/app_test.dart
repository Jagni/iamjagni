// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:iamjagni/keys.dart';
import 'package:test/test.dart';
import 'package:screenshots/screenshots.dart';

void main() {
  group('iAmJagni', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final profileTab = find.byValueKey(AppKeys.profileTab);
    final portfolioTab = find.byValueKey(AppKeys.portfolioTab);
    final formationTab = find.byValueKey(AppKeys.formationTab);

    final projectCircle = find.byValueKey(AppKeys.projectCircle(1));

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('screenshots', () async {
      // First, tap the button.
      final config = Config();

      await driver.waitFor(profileTab);
      await Future.delayed(const Duration(seconds: 5));
      await screenshot(driver, config, 'profile');

      await driver.tap(portfolioTab);
      await Future.delayed(const Duration(seconds: 5));
      await screenshot(driver, config, 'portfolio');

      await driver.tap(projectCircle);
      await Future.delayed(const Duration(seconds: 5));
      await screenshot(driver, config, 'project');

      await driver.tap(find.pageBack());
      await Future.delayed(const Duration(seconds: 1));

      await driver.tap(formationTab);
      await Future.delayed(const Duration(seconds: 5));
      await screenshot(driver, config, 'formation');
    }, timeout: Timeout.none);
  });
}
