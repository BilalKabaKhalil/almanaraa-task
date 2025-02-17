import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../constants/image_assets.dart';
import '../../../../../constants/translation_keys.dart';
import '../../../../../utils/extensions.dart';
import '../../../../data/models/shipment_model.dart';
import '../../../../enums/shipment_state_enum.dart';
import '../../../themes/app_theme.dart';
import 'shipment_stepper.dart';

class ExpandableCard extends StatefulWidget {
  final ShipmentModel shipment;

  const ExpandableCard({
    super.key,
    required this.shipment,
  });

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  var _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isExpanded
            ? widget.shipment.state == ShipmentStateEnum.isConfirmed
                ? min(63.0.hp, 390)
                : min(52.0.hp,320)
            : min(8.0.hp, 55),
        curve: Curves.easeInOut,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeaderPart(widget: widget, isExpanded: _isExpanded),
            if (_isExpanded)
              ExpandedPart(
                widget: widget,
              ),
          ],
        ),
      ),
    );
  }
}

class ExpandedPart extends StatelessWidget {
  const ExpandedPart({
    super.key,
    required this.widget,
  });

  final ExpandableCard widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 2.0.hp),
                child: ShipmentStepper(
                  curStep: widget.shipment.state,
                  completeStepColor: Colors.red,
                  unCompleteStepColor: Colors.grey,
                  lineWidth: 2,
                ),
              ),
              if (widget.shipment.state == ShipmentStateEnum.isConfirmed)
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        TranslationKeys.doYouWantConfirmAppointments.tr,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: const Color(0XFFF99D78),
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.hp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                fixedSize: WidgetStatePropertyAll(
                                  Size.fromWidth(35.0.wp),
                                ),
                              ),
                          child: Text(TranslationKeys.yesConfirm.tr),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                fixedSize: WidgetStatePropertyAll(
                                  Size.fromWidth(35.0.wp),
                                ),
                                backgroundColor: const WidgetStatePropertyAll(
                                  Colors.white,
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).primaryColor,
                                ),
                              ),
                          child: Text(TranslationKeys.noCancel.tr),
                        ),
                      ],
                    ),
                  ],
                ),
              SizedBox(
                height: 2.0.hp,
              ),
              SizedBox(
                width: 80.0.wp,
                height: 100,
                child: FlutterMap(
                  options: MapOptions(
                    initialZoom: 13,
                    initialCenter: LatLng(widget.shipment.location.latitude,
                        widget.shipment.location.longitude),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(markers: <Marker>[
                      Marker(
                        point: LatLng(widget.shipment.location.latitude,
                            widget.shipment.location.longitude),
                        child: SvgPicture.asset(ImageAssets.locationPin),
                      )
                    ]),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 80.0.wp,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grayColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.symmetric(vertical: 2.2.hp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      TranslationKeys.editAppointment.tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.grayColor),
                    ),
                    SvgPicture.asset(ImageAssets.editIcon),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderPart extends StatelessWidget {
  const HeaderPart({
    super.key,
    required this.widget,
    required bool isExpanded,
  }) : _isExpanded = isExpanded;

  final ExpandableCard widget;
  final bool _isExpanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.shipment.name,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        Text(
          'اليوم ${DateFormat('hh:mm a', 'ar').format(DateTime.now())}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          width: 6.0.wp,
        ),
        SvgPicture.asset(
          _isExpanded ? ImageAssets.upArrowIcon : ImageAssets.rightArrowBagIcon,
        ),
      ],
    );
  }
}
