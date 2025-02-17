import 'package:get/get.dart';

import './ar_SY/ar_sy_translation.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_SY': arSY,
      };
}
