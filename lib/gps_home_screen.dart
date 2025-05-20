import 'package:flutter/material.dart';
import 'package:location/location.dart';

class GpsHomeScreen extends StatefulWidget {
  const GpsHomeScreen({super.key});

  @override
  State<GpsHomeScreen> createState() => _GpsHomeScreenState();
}

class _GpsHomeScreenState extends State<GpsHomeScreen> {
  LocationData? currentLocation;

  Future<void> _getCurrentLocation() async {
    // bool isPermissionEnable = await _isLocationPermissionEnable();
    //
    // if (isPermissionEnable) {
    //   bool isGpsServiceEnable = await Location.instance.serviceEnabled();
    //   if (isGpsServiceEnable) {
    //     Location.instance.changeSettings(accuracy: LocationAccuracy.high);
    //     LocationData locationData = await Location.instance.getLocation();
    //     print(locationData);
    //     currentLocation = locationData;
    //     setState(() {});
    //   } else {
    //     Location.instance.requestService();
    //   }
    // } else {
    //   bool isPermissionGranted = await _requestPermission();
    //   if (isPermissionGranted) {
    //     _getCurrentLocation();
    //   }
    // }

    _onLocationPermissionAndServiceEnabled(() async {
      LocationData locationData = await Location.instance.getLocation();
      print(locationData);
      currentLocation = locationData;
      setState(() {});
    });
  }

  Future<void> _listenCurrentLocation() async {
    // bool isPermissionEnable = await _isLocationPermissionEnable();
    //
    // if (isPermissionEnable) {
    //   bool isGpsServiceEnable = await Location.instance.serviceEnabled();
    //   if (isGpsServiceEnable) {
    //     Location.instance.changeSettings(accuracy: LocationAccuracy.high, interval: 10000,distanceFilter: 3);
    //     Location.instance.onLocationChanged.listen((LocationData location) {
    //       print(location);
    //     });
    //   } else {
    //     Location.instance.requestService();
    //   }
    // } else {
    //   bool isPermissionGranted = await _requestPermission();
    //   if (isPermissionGranted) {
    //     _listenCurrentLocation();
    //   }
    // }

    //For Reusable Code
    _onLocationPermissionAndServiceEnabled(() {
      Location.instance.changeSettings(
          accuracy: LocationAccuracy.high, interval: 10000, distanceFilter: 3);
      Location.instance.onLocationChanged.listen((LocationData location) {
        print(location);
      });
    });
  }

  Future<void> _onLocationPermissionAndServiceEnabled(
      VoidCallback onSuccess) async {
    bool isPermissionEnable = await _isLocationPermissionEnable();

    if (isPermissionEnable) {
      bool isGpsServiceEnable = await Location.instance.serviceEnabled();
      if (isGpsServiceEnable) {
        onSuccess();
      } else {
        Location.instance.requestService();
      }
    } else {
      bool isPermissionGranted = await _requestPermission();
      if (isPermissionGranted) {
        _listenCurrentLocation();
      }
    }
  }

  Future<bool> _isLocationPermissionEnable() async {
    PermissionStatus locationPermission =
        await Location.instance.hasPermission();
    if (locationPermission == PermissionStatus.granted ||
        locationPermission == PermissionStatus.grantedLimited) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _requestPermission() async {
    PermissionStatus locationPermission =
        await Location.instance.requestPermission();
    if (locationPermission == PermissionStatus.granted ||
        locationPermission == PermissionStatus.grantedLimited) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gps Service Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Current Location : ${currentLocation?.latitude},${currentLocation?.longitude}'),
            TextButton(
              onPressed: () {
                _getCurrentLocation();
              },
              child: Text('Get Current Location'),
            ),
            TextButton(
              onPressed: () {
                _listenCurrentLocation();
              },
              child: Text('Listen Current Location'),
            ),
          ],
        ),
      ),
    );
  }
}
