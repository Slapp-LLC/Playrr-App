import 'package:geolocator/geolocator.dart';

class LocationService {
  // Singleton pattern
  static final LocationService instance = LocationService._();
  factory LocationService() => instance;
  LocationService._();

  // Instance of Geolocator
  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;

  // Get the current location
  Future<Position?> getCurrentLocation() async {
    try {
      final Position position = await _determinePosition();
      return position;
    } on Exception catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }

  // Calculate the distance between two coordinates
  double calculateDistance(double startLatitude, double startLongitude,
      double endLatitude, double endLongitude) {
    return Geolocator.distanceBetween(
        startLatitude, startLongitude, endLatitude, endLongitude);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}