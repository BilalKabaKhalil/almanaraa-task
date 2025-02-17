part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const navigation = _Paths.navigation;
  static const home = _Paths.home;
  static const account = _Paths.account;
  static const shippingCalculator = _Paths.shippingCalculator;
  static const wallet = _Paths.wallet;
}

abstract class _Paths {
  _Paths._();
  static const navigation = '/navigation';
  static const home = '/home';
  static const account = '/account';
  static const shippingCalculator = '/shippingCalculator';
  static const wallet  = '/wallet';
}
