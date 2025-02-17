import 'package:flutter/material.dart';

import '../../../../enums/shipment_state_enum.dart';

class ShipmentStepper extends StatelessWidget {
  final ShipmentStateEnum curStep;
  final Color completeStepColor;
  final Color unCompleteStepColor;
  final double lineWidth;
  final List<String> steps = const [
    'تم الحجز',
    'تأكيد الموعد',
    'في الطريق',
    'استلام الطلب',
  ];

  const ShipmentStepper({
    super.key,
    required this.curStep,
    required this.completeStepColor,
    required this.lineWidth,
    required this.unCompleteStepColor,
  });

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < steps.length; i++) {
      //colors according to state

      var circleColor = getCircleColor(i);
      var lineColor = getLineColor(i);

      // step circles
      list.add(
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Container(),
        ),
      );
      //line between step circles
      if (i != steps.length - 1) {
        list.add(
          Expanded(
            child: Container(
              height: lineWidth,
              color: lineColor,
            ),
          ),
        );
      }
    }

    return list;
  }

  getCircleColor(i) {
    Color color;
    if (i  > curStep.index) {
      color = unCompleteStepColor;
    } else {
      color = completeStepColor;
    }
    return color;
  }

  getLineColor(i) {
    var color = curStep.index > i  ? completeStepColor : unCompleteStepColor;
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Column(
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: steps.asMap().entries
                .map(
                  (step) => FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      step.value,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: step.key == curStep.index ? Theme.of(context).primaryColor : unCompleteStepColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: _steps(),
            ),
          ),
        ],
      ),
    );
  }
}
