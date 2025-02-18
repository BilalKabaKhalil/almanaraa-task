import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/translation_keys.dart';
import '../../../utils/extensions.dart';
import '../../controllers/home_controller/home_controller.dart';
import 'app_theme.dart';

class AdaptiveSearchField extends GetView<HomeController> {
  const AdaptiveSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.0.wp,
      ),
      child: Platform.isIOS
          ? CupertinoTextField(
              placeholder: TranslationKeys.searchFieldHint.tr,
              placeholderStyle:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.grayColor,
                      ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grayColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
              prefix: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.search,
                  color: AppColors.grayColor,
                ),
              ),
            )
          : TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(4.0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grayColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                hintText: TranslationKeys.searchFieldHint.tr,
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.grayColor,
                    ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.grayColor,
                ),
              ),
              onChanged: (value) => controller.searchWithDebounce(value),
            ),
    );
  }
}
