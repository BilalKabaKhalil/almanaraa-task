import 'package:get/get.dart';

import '../view/android/navigation_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.navigation;

  static final List<GetPage<dynamic>> routs = [
    GetPage(
      name: Routes.navigation,
      page: () => const NavigationPage(),
    ),
  ];
}
