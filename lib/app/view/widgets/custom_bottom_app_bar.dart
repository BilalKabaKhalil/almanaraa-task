import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/extensions.dart';
import '../../controllers/bottom_app_bar_controller/bottom_app_bar_controller.dart';
import '../themes/app_theme.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomAppBarController>();
    return BottomAppBar(
      padding: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.onSurface,
      child: ColoredBox(
        color: const Color(0XFFFFFCFA),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 3.0.wp,
            vertical: 1.5.hp,
          ),
          child: Row(
            children: List.generate(
              controller.bottomAppBarList.length,
              (index) => AppBarButton(index: index),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  final int index;

  const AppBarButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomAppBarController>();
    final appBarItem = controller.bottomAppBarList[index];

    return SizedBox(
      width: (100.0.wp - 3.0.wp * 2)/ 4,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
        onPressed: () {
          controller.changePage(appBarItem.page.name);
        },
        child: Obx(
          () {
            final isSelected =
                controller.currentPage.value == appBarItem.page.name;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                spacing: 0.3.hp,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: SvgPicture.asset(
                      appBarItem.iconPath,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(isSelected ? AppColors.burgundyColor : AppColors.grayColor, BlendMode.srcIn),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      appBarItem.title,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: isSelected
                                ? AppColors.burgundyColor
                                : AppColors.grayColor,
                            fontSize: 11,
                          ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
