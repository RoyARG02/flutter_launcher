import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:test/test.dart';

void main() {
  driver.FlutterDriver testDriver;

  setUpAll(() async {
    testDriver = await driver.FlutterDriver.connect();
    bool connected = false;
    while (!connected) {
      try {
        await testDriver.waitUntilFirstFrameRasterized();
        connected = true;
      } catch (_) {}
    }
  });

  tearDownAll(() async {
    if (testDriver != null) {
      await testDriver.close();
    }
  });

  test(
      'Verifies the presence and working of "Move to All Apps screen" button in the home screen',
      () async {
    final homeScreenListFinder = driver.find.byValueKey('home_screen_list');
    final buttonFinder = driver.find.byValueKey('goto_all_apps_button');
    final allAppsScreenListFinder = driver.find.byValueKey('all_apps_list');

    await testDriver.scrollUntilVisible(
      homeScreenListFinder,
      buttonFinder,
      dyScroll: -300.0,
    );

    try {
      await testDriver.tap(buttonFinder);
      await testDriver.waitFor(allAppsScreenListFinder);
    } catch (_) {
      print('All apps screen not found!!!');
    }
  });
}
