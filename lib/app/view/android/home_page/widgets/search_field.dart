import 'package:almanara/app/controllers/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/translation_keys.dart';
import '../../../../../utils/extensions.dart';
import '../../../themes/app_theme.dart';

class SearchField extends GetView<HomeController> {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.0.wp,
      ),
      child: TextField(
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
