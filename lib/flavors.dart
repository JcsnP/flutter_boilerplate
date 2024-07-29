enum Flavor {
  dev,
  beta,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Flutter Boilerplate-dev';
      case Flavor.beta:
        return 'Flutter Boilerplate-beta';
      case Flavor.prod:
        return 'Flutter Boilerplate-prod';
      default:
        return 'title';
    }
  }

}
