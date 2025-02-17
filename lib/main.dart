import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/bindings/app_binding.dart';
import 'app/routers/app_pages.dart';
import 'app/translations/app_translations.dart';
import 'app/view/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar');
  await setStatusBarAndNavigationBarColors();
  // Set up bindings
  await AppBindings().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.ltr,
      theme: AppTheme.lightTheme,
      title: 'almanara',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routs,
      translations: AppTranslation(),
      locale: const Locale('ar', 'SY'),
    );
  }
}
