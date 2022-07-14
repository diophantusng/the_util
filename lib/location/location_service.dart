import 'user_location.dart';

abstract class LocationService {
  getLocation();
  Stream<UserLocation> get locationStream;
}
