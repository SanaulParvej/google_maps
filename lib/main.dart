import 'package:flutter/material.dart';
import 'package:my_maps_app/gps_home_screen.dart';

void main(){
  runApp(GoogleMapsAps());
}
class GoogleMapsAps extends StatelessWidget {
  const GoogleMapsAps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GpsHomeScreen(),
    );
  }
}

