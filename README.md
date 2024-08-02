# flutter_boilerplate

A flutter boilerplate project uses Bloc (Cubit).

## Getting Started
1. Edit flavorizr
```yaml
flavors:
  dev:
    app:
      name: "Flutter Boilerplate-dev"
    android:
      applicationId: "jcsnp.flutter_boilerplate.dev"
    ios:
      bundleId: "jcsnp.flutter_boilerplate.dev"

  beta:
    app:
      name: "Flutter Boilerplate-beta"
    android:
      applicationId: "jcsnp.flutter_boilerplate.beta"
    ios:
      bundleId: "jcsnp.flutter_boilerplate.beta"

  prod:
    app:
      name: "Flutter Boilerplate"
    android:
      applicationId: "jcsnp.flutter_boilerplate"
    ios:
      bundleId: "jcsnp.flutter_boilerplate"
```

2. Run flavorizr to generate flavor files, main.dart and pages
```
flutter pub run flutter_flavorizr
```

3. Change splash screen and icon path in pubspec.yaml (replace your image files into the folder)
```dart
flutter_native_splash:
  color: "ffffff"
  image: "assets/images/splash/splash_logo_light.png"
  color_dark: "000000"
  image_dark: "assets/images/splash/splash_logo_dark.png"
  android_12:
    image: "assets/images/splash/splash_logo_light.png"
    color: "ffffff"
    image_dark: "assets/images/splash/splash_logo_dark.png"
    icon_background_color_dark: "000000"
  android: true
  ios: true

flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/icons/capybara.png"
  remove_alpha_ios: true
```

then run following commands to generate splash screen and icon
```
flutter pub run flutter_native_splash:create
```
and
```
flutter pub run flutter_launcher_icons
```

4. Wrap main.dart in runZonedGuarded if needed
```dart
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
```
