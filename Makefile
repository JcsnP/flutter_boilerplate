build_flavor:
	flutter pub run flutter_flavorizr

clearn:
	flutter clearn

build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs

build_splash_screen:
	flutter pub run flutter_native_splash:create

build_launcher_icon:
	flutter pub run flutter_launcher_icons

build_i18n:
	flutter gen-l10n

run_dev:
	flutter run --flavor dev -t lib/main_dev.dart;

run_beta:
	flutter run --flavor beta -t lib/main_beta.dart;

run_prod:
	flutter run --flavor prod -t lib/main_prod.dart;

android_beta:
	flutter build appbundle --flavor beta -t lib/main_beta.dart

android_prod:
	flutter build appbundle --flavor prod -t lib/main_prod.dart
