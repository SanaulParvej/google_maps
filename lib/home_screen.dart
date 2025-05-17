import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GoogleMapController _mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid ,
          initialCameraPosition: CameraPosition(
            zoom: 17,
              target: LatLng(23.87647219519752, 90.32130465437892)),
        zoomControlsEnabled: true,
        compassEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller){
          _mapController = controller;

        },

      ),
    );
  }
  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
