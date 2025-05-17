import 'package:flutter/material.dart';
import 'home_screen.dart';

void main(){
  runApp(GoogleMapsAps());
}
class GoogleMapsAps extends StatelessWidget {
  const GoogleMapsAps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

