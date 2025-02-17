import 'package:flutter/material.dart';

import '../../../../../utils/extensions.dart';
import '../../../../data/models/box_button_model.dart';
import 'custom_box_view.dart';

class BoxButtonsList extends StatelessWidget {
  final List<BoxButtonModel> boxButtonsList;
  const BoxButtonsList({
    super.key,
    required this.boxButtonsList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4.0.wp,
            vertical: 3.0.hp
          ),
          child: Row(
            spacing: 2.0.wp,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: boxButtonsList
                .map(
                  (boxButton) => CustomBoxView(
                    title: boxButton.title,
                    iconPath: boxButton.iconPath,
                    width: (100.0.wp - 2.0.wp * 3 - 8.0.wp) / 4,
                  ),
                )
                .toList(),
          ),
        );
  }
}
