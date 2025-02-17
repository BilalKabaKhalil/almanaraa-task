import 'package:get/get.dart';

import '../../data/repositories/box_buttons_repository.dart';
import '../../data/repositories/shipment_repository.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BoxButtonsRepository());
    Get.lazyPut(() => ShipmentRepository());

    Get.put<HomeController>(
      HomeController(
        boxButtonsRepository: Get.find<BoxButtonsRepository>(),
        shipmentRepository: Get.find<ShipmentRepository>()
      ),
    );
  }
}
