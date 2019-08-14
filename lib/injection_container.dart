import 'package:geolocator/geolocator.dart';
import 'package:gps_logger/data/repository/repository.dart';
import 'package:gps_logger/ui/locator/locator_bloc.dart';
import 'package:gps_logger/wrapper/geolocator_wrapper.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

void initKiwi() {
  kiwi.Container()
    ..registerInstance(Geolocator())
    ..registerInstance(LocationStoreRepository())
    ..registerFactory((c) => GeolocatorWrapper(c.resolve()))
    ..registerFactory((c) => LocatorRepository(c.resolve()))
    ..registerFactory((c) => LocatorBloc(c.resolve()));
}
