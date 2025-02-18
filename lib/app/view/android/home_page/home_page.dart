import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/translation_keys.dart';
import '../../../../utils/extensions.dart';
import '../../../controllers/home_controller/home_binding.dart';
import '../../../controllers/home_controller/home_controller.dart';
import '../../themes/app_theme.dart';
import 'widgets/box_buttons_list.dart';
import 'widgets/expandable_card.dart';
import '../../themes/adaptive_search_field.dart';
import 'widgets/shipment_container.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBinding().dependencies();
    return SingleChildScrollView(
      child: Column(
        spacing: 0.5.hp,
        children: <Widget>[
          BoxButtonsList(boxButtonsList: controller.boxButtonsList),
          const AdaptiveSearchField(),
          Padding(
            padding: EdgeInsets.all(4.0.wp),
            child: Container(
              width: 92.0.wp,
              height: 45.0.hp,
              decoration: const BoxDecoration(
                color: Color(0XFFFEF3EE),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 4.0.wp),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          TranslationKeys.myAppointments.tr,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    Obx(
                      () => Column(
                        children: controller.filteredShipments
                            .map(
                              (shipment) => ExpandableCard(
                                shipment: shipment,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.0.wp),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          TranslationKeys.previousAppointments.tr,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.grayColor,
                                  ),
                        ),
                      ),
                    ),
                    GetBuilder<HomeController>(
                      id: 'updateRating',
                      builder: (_) => Column(
                        children: controller.previousShipments
                            .map(
                              (shipment) => ShipmentContainer(
                                shipment: shipment,
                              ),
                            )
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
