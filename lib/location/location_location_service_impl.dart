import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'location_service.dart';
import 'user_location.dart';

class LocationLocationService implements LocationService {
  // Keep track of current Location
  UserLocation? _currentLocation;
  var location = Location();
  // Continuously emit location updates
  final StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  LocationLocationService() {
    // Request permission to use location
    location.requestPermission().then((status) {
      if (status == PermissionStatus.granted) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged.listen((locationData) {
          _locationController.add(UserLocation(
            latitude: locationData.latitude,
            longitude: locationData.longitude,
          ));
        });
      }
    });
  }

  @override
  Stream<UserLocation> get locationStream => _locationController.stream;

  @override
  Future<UserLocation?> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      debugPrint('Could not get location: ${e.toString()}');
    }
    return _currentLocation;
  }
}
