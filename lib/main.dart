import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_platform/universal_platform.dart';
import 'app.dart';

// FutureOr<void> main() async {
//   runApp(const App());
// }

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
        await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      }

      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
      );

      // Initialize Hive
      final appDocumentDir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(appDocumentDir.path);

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: UniversalPlatform.isWeb ? HydratedStorage.webStorageDirectory : appDocumentDir,
      );

      FlutterNativeSplash.remove();

      // Initialize the RevenueCat SDK

      return runApp(const App());
    },
    (exception, stackTrace) async {
      print('Error: $exception');
      print('Stack: $stackTrace');
    },
  );
}
