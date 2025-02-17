import 'package:get/get.dart';

import '../../../constants/image_assets.dart';
import '../../../constants/translation_keys.dart';
import '../models/box_button_model.dart';

class BoxButtonsRepository {
  List<BoxButtonModel> get boxButtonsList => [
        BoxButtonModel(
          title: TranslationKeys.boxAndExpress.tr,
          iconPath: ImageAssets.boxIcon,
        ),
        BoxButtonModel(
          title: TranslationKeys.buyMe.tr,
          iconPath: ImageAssets.shoppingBagIcon,
        ),
        BoxButtonModel(
          title: TranslationKeys.homeFurnitureShipping.tr,
          iconPath: ImageAssets.shippingIcon,
        ),
        BoxButtonModel(
          title: TranslationKeys.packagingMaterials.tr,
          iconPath: ImageAssets.packagingIcon,
        ),
      ];
}
