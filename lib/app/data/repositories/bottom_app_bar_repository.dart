import 'package:get/get.dart';

import '../../../constants/image_assets.dart';
import '../../../constants/translation_keys.dart';
import '../../routers/app_pages.dart';
import '../../view/android/account_page.dart';
import '../../view/android/home_page/home_page.dart';
import '../../view/android/shipping_calculator_page.dart';
import '../../view/android/wallet_page.dart';
import '../models/bottom_app_bar_model.dart';

class BottomAppBarRepository {
  List<BottomAppBarModel> get bottomAppBarList => [
        BottomAppBarModel(
          title: TranslationKeys.myAccount.tr,
          iconPath: ImageAssets.accountIcon,
          page: GetPage(
            name: Routes.account,
            page: () => const AccountPage(),
          ),
        ),
        BottomAppBarModel(
          title: TranslationKeys.myWallet.tr,
          iconPath: ImageAssets.walletIcon,
          page: GetPage(
            name: Routes.wallet,
            page: () => const WalletPage(),
          ),
        ),
        BottomAppBarModel(
          title: TranslationKeys.shippingCalculator.tr,
          iconPath: ImageAssets.calculatorIcon,
          page: GetPage(
            name: Routes.shippingCalculator,
            page: () => const ShippingCalculatorPage(),
          ),
        ),
        BottomAppBarModel(
          title: TranslationKeys.home.tr,
          iconPath: ImageAssets.homeIcon,
          page: GetPage(
            name: Routes.home,
            page: () => const HomePage(),
          ),
        ),
      ];
}
