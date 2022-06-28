import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart'as locator;
import 'package:location/location.dart';


class LocationController extends GetxController {

  final box = GetStorage();
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  locator.Location location = locator.Location();

  var address;

  late bool _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  LocationData? get locationData => _locationData;

  Future<LocationData?> getLocation() async {
    _loading.value = true;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print("permission to get access to location denied");
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("permission to get access to location denied");
        return null;
      }
    }
    _locationData = await location.getLocation();
    await getAddressFromLatLang(_locationData!);
    print(_locationData);
    _loading.value = false;
    update();
    return _locationData;
  }


  Future<void> getAddressFromLatLang(LocationData locationData) async {
    List<Placemark> placeMark =
    await placemarkFromCoordinates(locationData.latitude!, locationData.longitude!);
    Placemark place = placeMark[0];
    print(place);
    address = place;
  }






}
