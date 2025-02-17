import 'package:get/get.dart';

import '../../data/models/bottom_app_bar_model.dart';
import '../../data/repositories/bottom_app_bar_repository.dart';
import '../../routers/app_pages.dart';

class BottomAppBarController extends GetxController {
  final BottomAppBarRepository bottomAppBarRepository;

  BottomAppBarController({required this.bottomAppBarRepository});

  var currentPage = RxString(Routes.home);

  changePage(String currentPage) {
    this.currentPage.value = currentPage;
    update();
  }

  List<BottomAppBarModel> get bottomAppBarList => bottomAppBarRepository.bottomAppBarList;
}
