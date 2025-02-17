import '../models/shipment_model.dart';
import '../test/shipment_data.dart';

class ShipmentRepository {
  List<ShipmentModel> get getAllTodayShipment => ShipmentData().todayShipments;
  List<ShipmentModel> get getAllPreviousShipment => ShipmentData().previousShipments;
}
