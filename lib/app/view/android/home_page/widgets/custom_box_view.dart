import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/extensions.dart';

class CustomBoxView extends StatelessWidget {
  final String title, iconPath;
  final double? width;
  const CustomBoxView({
    super.key,
    required this.title,
    required this.iconPath,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        spacing: 0.5.hp,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Text(
            title,
            maxLines: 2,
            softWrap: true,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
