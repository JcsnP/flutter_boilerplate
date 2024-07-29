import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:universal_platform/universal_platform.dart';

class RevenueCatService {
  static Future<void> initPlatformState() async {
    await Purchases.setLogLevel(LogLevel.debug);

    PurchasesConfiguration configuration;
    if (UniversalPlatform.isAndroid) {
      configuration = PurchasesConfiguration("API_KEY_ANDROID");
    } else if (UniversalPlatform.isIOS) {
      configuration = PurchasesConfiguration("API_KEY_IOS");
    } else {
      throw ArgumentError("Unsupported platform");
    }
    await Purchases.configure(configuration);
  }
}
