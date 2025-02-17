import '../../enums/shipment_state_enum.dart';
import '../models/shipment_model.dart';

class ShipmentData {
  final List<ShipmentModel> todayShipments = <ShipmentModel>[
    ShipmentModel(
      id: '1',
      name: 'أحمد محمد الفاخوري',
      dateTime: DateTime.now(),
      state: ShipmentStateEnum.isQuarantined,
      rating: 5,
      location: const ShipmentLocation(
        latitude: 35.28577,
        longitude: 37.12626,
      ),
    ),
    ShipmentModel(
      id: '2',
      name: 'عمر محمد',
      rating: 3,
      dateTime: DateTime.now(),
      state: ShipmentStateEnum.isConfirmed,
      location: const ShipmentLocation(
        latitude: 35.28577,
        longitude: 37.12626,
      ),
    ),
  ];

  final List<ShipmentModel> previousShipments = <ShipmentModel>[
    ShipmentModel(
      id: '3',
      name: 'أحمد ياسين',
      rating: 0,
      dateTime: DateTime(2024, 1, 16, 5, 42),
      state: ShipmentStateEnum.isOnWay,
      location: const ShipmentLocation(
        latitude: 35.28577,
        longitude: 37.12626,
      ),
    ),
    ShipmentModel(
      id: '4',
      name: 'عمرو الخالد',
      state: ShipmentStateEnum.isDelivered,
      rating: 3,
      dateTime: DateTime(2023, 1, 16, 5, 42),
      location: const ShipmentLocation(
        latitude: 35.28577,
        longitude: 37.12626,
      ),
    ),
    ShipmentModel(
      id: '5',
      name: 'عبد الله محمد الاحمد',
      dateTime: DateTime(2024, 1, 16, 8, 50),
      location: const ShipmentLocation(
        latitude: 35.28577,
        longitude: 37.12626,
      ),
    ),
    ShipmentModel(
      id: '6',
      name: 'خليل بك',
      dateTime: DateTime(2024, 9, 12, 12, 00),
      location: const ShipmentLocation(
        latitude: 35.28577,
        longitude: 37.12626,
      ),
    ),
    ShipmentModel(
      id: '7',
      name: 'مهند',
      state: ShipmentStateEnum.isCanceled,
      dateTime: DateTime(2021, 1, 16, 5, 42),
      location: const ShipmentLocation(
        latitude: 35.28577,
        longitude: 37.12626,
      ),
    ),
  ];
}
