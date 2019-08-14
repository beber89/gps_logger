import 'package:gps_logger/data/model/model.dart';

class LocationStoreRepository {
  List<PositionStore> _positionStore;
  List<PositionStore> get positionStore => _positionStore;

  void addPosition(PositionStore pStore) {
    _positionStore.add(pStore);
  }
}