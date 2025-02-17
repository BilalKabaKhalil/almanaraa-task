import '../../enums/shipment_state_enum.dart';

class ShipmentLocation {
  final double latitude, longitude;

  const ShipmentLocation({
    required this.latitude,
    required this.longitude,
  });
}

class ShipmentModel {
  final String id, name;
  final DateTime dateTime;
  final ShipmentLocation location;
  ShipmentStateEnum state;
  int? rating;

  ShipmentModel({
    required this.id,
    required this.name,
    required this.dateTime,
    required this.location,
    this.state = ShipmentStateEnum.isQuarantined,
    this.rating,
  });
}
