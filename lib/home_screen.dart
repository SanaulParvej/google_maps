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
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
            zoom: 17, target: LatLng(23.87647219519752, 90.32130465437892)),
        zoomControlsEnabled: true,
        compassEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        onTap: (LatLng latLng) {
          print(latLng);
        },
        onLongPress: (LatLng latLng) {
          print('Long press at $latLng');
        },
        markers: {
          Marker(
            markerId: MarkerId('My_Location'),
            position: LatLng(23.87647219519752, 90.32130465437892),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            onTap: () {
              print("Tap on my marker");
            },
            visible: true,
            infoWindow: InfoWindow(title: 'My Location'),
          ),
          Marker(
            markerId: MarkerId('Diu_Location'),
            position: LatLng(23.87690205522418, 90.31992752104998),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            onTap: () {
              print("Tap on my marker");
            },
            visible: true,
            infoWindow: InfoWindow(title: 'My Location'),
          ),
          Marker(
            markerId: MarkerId('Drag_Location'),
            position: LatLng(23.878769434297524, 90.3224129229784),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueMagenta),
            onTap: () {
              print("Tap on my marker");
            },
            visible: true,
            draggable: true,
            onDrag: (LatLng lonLng) {},
            onDragStart: (LatLng startedLatLng) {},
            onDragEnd: (LatLng endLatLng) {
              print(endLatLng);
            },
            infoWindow: InfoWindow(title: 'My Location'),
          )
        },
        polylines: {
          Polyline(
              polylineId: PolylineId('StraightLine'),
              width: 10,
              color: Colors.green,
              startCap: Cap.squareCap,
              endCap: Cap.roundCap,
              points: [
                LatLng(23.87558466455003, 90.32017596065998),
                LatLng(23.874937154607892, 90.32399173825979),
                LatLng(23.87678463416544, 90.32283671200275),
                LatLng(23.877935539895805, 90.32314952462912)
              ],
              jointType: JointType.round),
        },
        circles: {
          Circle(
            circleId: CircleId('Virus'),
            center: LatLng(23.88080478854944, 90.32189257442951),
            radius: 50,
            strokeWidth: 8,
            strokeColor: Colors.red,
            fillColor: Colors.red.withOpacity(0.5),
          ),
        },
        polygons: {
          Polygon(
              polygonId: PolygonId('Random_Polygon'),
              fillColor: Colors.green.withOpacity(0.5),
              strokeWidth: 6,
              strokeColor: Colors.black,
              points: [
                LatLng(23.876925355473823, 90.32048139721155),
                LatLng(23.876874462817863, 90.32126627862453),
                LatLng(23.875787317327603, 90.32121531665325),
                LatLng(23.875824107510386, 90.32037142664194),
              ])
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.directions_bike),
          onPressed: () {
            //moving camera position
            // _mapController.moveCamera(
            //   CameraUpdate.newCameraPosition(
            //     CameraPosition(
            //       target: LatLng(23.875866722792367, 90.32207865267992),
            //     ),
            //   ),
            // );
            _mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  zoom: 22,
                  target: LatLng(23.877884034477184, 90.32000932842493),
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
