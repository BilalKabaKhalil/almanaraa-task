import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/image_assets.dart';
import '../../controllers/bottom_app_bar_controller/bottom_app_bar_controller.dart';
import '../themes/app_theme.dart';

class CupertinoHomeScreen extends GetView<BottomAppBarController> {
  const CupertinoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // Bottom Navigation Bar
      tabBar: CupertinoTabBar(
        backgroundColor: const Color(0XFFFFFCFA),
        height: 65,
        items: controller.bottomAppBarList
            .map(
              (appBarItem) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  appBarItem.iconPath,
                  fit: BoxFit.scaleDown,
                  colorFilter: const ColorFilter.mode(
                      AppColors.grayColor, BlendMode.srcIn),
                ),
                activeIcon: SvgPicture.asset(
                  appBarItem.iconPath,
                  fit: BoxFit.scaleDown,
                  colorFilter: const ColorFilter.mode(
                      AppColors.burgundyColor, BlendMode.srcIn),
                ),
                label: appBarItem.title,
              ),
            )
            .toList(),
        activeColor: AppColors.burgundyColor,
        currentIndex: 3,
        inactiveColor: CupertinoColors.inactiveGray,
      ),

      // Tab Views
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              // Top App Bar
              navigationBar: CupertinoNavigationBar(
                padding: const EdgeInsetsDirectional.only(
                  top: 16,
                  start: 8,
                  end: 8,
                ),
                leading: SvgPicture.asset(ImageAssets.logoIcon),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    CupertinoIcons.bell_solid,
                    size: 28,
                  ),
                  onPressed: () => _handleAddAction(),
                ),
              ),

              // Page Content
              child: SafeArea(
                child: Stack(
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: controller.bottomAppBarList[index].page.page(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _handleAddAction() {
    // Handle app bar button action
  }
}
