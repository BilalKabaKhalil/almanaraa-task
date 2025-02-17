import 'dart:async';

import 'package:get/get.dart';

import '../../data/models/box_button_model.dart';
import '../../data/models/shipment_model.dart';
import '../../data/repositories/box_buttons_repository.dart';
import '../../data/repositories/shipment_repository.dart';

class HomeController extends GetxController {
  final BoxButtonsRepository boxButtonsRepository;
  final ShipmentRepository shipmentRepository;

  late List<ShipmentModel> todayShipments, previousShipments;
  final RxList<ShipmentModel> filteredShipments = <ShipmentModel>[].obs;
  final RxString searchText = ''.obs;
  Timer? _debounce;

  HomeController({
    required this.boxButtonsRepository,
    required this.shipmentRepository,
  });

  @override
  void onInit() {
    todayShipments = shipmentRepository.getAllTodayShipment;
    previousShipments = shipmentRepository.getAllPreviousShipment;
    filteredShipments.assignAll(todayShipments);
    super.onInit();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

  void filterShipments(String query) {
    if (query.isEmpty) {
      filteredShipments.assignAll(todayShipments);
    } else {
      filteredShipments.assignAll(
        todayShipments.where(
          (shipment) =>
              shipment.name.toLowerCase().contains(query.toLowerCase()) ||
              shipment.id.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }

  void searchWithDebounce(String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () => filterShipments(query),
    );
  }

  void updateRating(int newRating, String shipmentId) {
    previousShipments
        .singleWhere((shipment) => shipment.id == shipmentId)
        .rating = newRating;
    update(['updateRating']);
  }

  List<BoxButtonModel> get boxButtonsList =>
      boxButtonsRepository.boxButtonsList;
}
