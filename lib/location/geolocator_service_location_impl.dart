// import 'dart:async';

// import 'package:geolocator/geolocator.dart';
// import 'location_service.dart';
// import 'user_location.dart';

// class GeolocatorLocationService implements LocationService {

//   // Keep track of current Location
//   UserLocation? _currentLocation;
//   var geolocator = Geolocator();
//   var locationOptions = const LocationOptions(
//       accuracy: LocationAccuracy.high, distanceFilter: 10);

//   // Continuously emit location updates
//   final StreamController<UserLocation> _locationController =
//       StreamController<UserLocation>();

//   GeolocatorLocationServiceImpl() {
//     Geolocator().checkPermission().then((status) {
//       if (status.index == 0) {
//         geolocator
//             .getPositionStream(locationOptions)
//             .listen((Position position) {
//           _locationController.add(UserLocation(
//             latitude: position.latitude,
//             longitude: position.longitude,
//           ));

//           print(position == null
//               ? 'Unknown'
//               : position.latitude.toString() +
//                   ', ' +
//                   position.longitude.toString());
//         });
//       }
//     });
//   }

//   @override
//   Stream<UserLocation> get locationStream => _locationController.stream;

//   @override
//   Future<UserLocation?> getLocation() async {
//     try {
//       var userLocation = await Geolocator()
//           .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

//       _currentLocation = UserLocation(
//         latitude: userLocation.latitude,
//         longitude: userLocation.longitude,
//       );
//     } on Exception catch (e) {
//       print('Could not get location: ${e.toString()}');
//     }
//     return _currentLocation;
//   }
// }
