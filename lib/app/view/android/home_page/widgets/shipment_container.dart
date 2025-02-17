import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/translation_keys.dart';
import '../../../../../utils/extensions.dart';
import '../../../../data/models/shipment_model.dart';
import '../../../../enums/shipment_state_enum.dart';
import '../../../themes/app_theme.dart';
import 'rating_dialog.dart';

class ShipmentContainer extends StatelessWidget {
  final ShipmentModel shipment;
  const ShipmentContainer({
    super.key,
    required this.shipment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: min(8.0.hp, 55),
      margin: EdgeInsets.symmetric(
        horizontal: 4.0.wp,
        vertical: 1.5.hp,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 4.0.wp,
        vertical: 1.0.hp,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            shipment.name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          Text(
            DateFormat('dd/MM/yyyy').format(shipment.dateTime),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            width: 2.0.wp,
          ),
          shipment.state == ShipmentStateEnum.isCanceled
              ? SizedBox(
                  width: 70,
                  child: Center(
                    child: Text(
                      TranslationKeys.isCanceled.tr,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.grayColor,
                          ),
                    ),
                  ),
                )
              : shipment.rating == null
                  ? SizedBox(
                      height: 25,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.dialog(
                            RatingDialog(
                              shipmentId: shipment.id,
                            ),
                          );
                        },
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                  vertical: 0.3.wp,
                                ),
                              ),
                            ),
                        child: Text(
                          TranslationKeys.rateNow.tr,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 70,
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < shipment.rating!
                                ? Icons.star
                                : Icons.star_border,
                            size: 14,
                            color: AppColors.goldColor,
                          ),
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}
