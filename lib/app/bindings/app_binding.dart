import 'package:get/get.dart';

import '../controllers/bottom_app_bar_controller/bottom_app_bar_controller.dart';
import '../data/repositories/bottom_app_bar_repository.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {

    // Initialize Data Layer

    // Initialize Repository Layer
    Get.lazyPut(
      () => BottomAppBarRepository(
      ),
    );

    // Initialize controller Layer
    Get.lazyPut(
      () => BottomAppBarController(
        bottomAppBarRepository: Get.find<BottomAppBarRepository>(),
      ),
    );
  }
}
