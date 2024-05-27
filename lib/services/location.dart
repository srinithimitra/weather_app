import 'package:clima/utilities/log.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      logger.i(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      logger.e(e);
    }
  }
}
