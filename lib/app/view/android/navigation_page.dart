import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/image_assets.dart';
import '../../../utils/extensions.dart';
import '../../controllers/bottom_app_bar_controller/bottom_app_bar_controller.dart';
import '../widgets/custom_bottom_app_bar.dart';
import '../ios/ios_navigation_page.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomAppBarController = Get.find<BottomAppBarController>();
    return SafeArea(
      child: Platform.isIOS
          ? const CupertinoHomeScreen()
          : Scaffold(
              floatingActionButton: Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: () {},
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBar(),
              appBar: AppBar(
                titleSpacing: 6.0.wp,
                elevation: 0,
                title: SvgPicture.asset(ImageAssets.logoIcon),
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 4.0.wp),
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications_active,
                        size: 32,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: Navigator(
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (_) => Obx(
                      () => bottomAppBarController.bottomAppBarList
                          .singleWhere(
                            (element) =>
                                element.page.name ==
                                bottomAppBarController.currentPage.value,
                          )
                          .page
                          .page(),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
