import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/translation_keys.dart';
import '../../../../controllers/home_controller/home_controller.dart';

class RatingDialog extends StatefulWidget {
  final String shipmentId;
  const RatingDialog({
    super.key,
    required this.shipmentId,
  });

  @override
  RatingDialogState createState() => RatingDialogState();
}

class RatingDialogState extends State<RatingDialog> {
  int _stars = 0;

  Widget _buildStar(int starCount) {
    return InkWell(
      child: Icon(
        Icons.star,
        // size: 30.0,
        color: _stars >= starCount ? Colors.orange : Colors.grey,
      ),
      onTap: () {
        setState(() {
          _stars = starCount;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(TranslationKeys.rateThisShipment.tr),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildStar(5),
          _buildStar(4),
          _buildStar(3),
          _buildStar(2),
          _buildStar(1),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(TranslationKeys.cancel.tr),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text(TranslationKeys.ok.tr),
          onPressed: () {
            Get.find<HomeController>().updateRating(_stars, widget.shipmentId);
            Get.back();
          },
        )
      ],
    );
  }
}
