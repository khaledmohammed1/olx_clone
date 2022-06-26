import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController{
  Location location = Location();

  late bool _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  LocationData? get locationData => _locationData;

  Future<LocationData?>getLocation()async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    update();
    return _locationData;
  }
}