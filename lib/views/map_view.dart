// lib/views/map_view.dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import '../constants.dart';
import '../widgets/custom_app_bar.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  MapboxMap? mapboxMap;
  geo.Position? _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Carte Mapbox"),
      body: Stack(
        children: [
          MapWidget(
            onMapCreated: (map) {
              setState(() => mapboxMap = map);
              _updateLocationSettings();
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: _getCurrentLocation,
              child: const Icon(Icons.my_location, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _updateLocationSettings() {
    mapboxMap?.location.updateSettings(
      LocationComponentSettings(
        enabled: true,
        pulsingEnabled: true,
        pulsingColor: Colors.blue.value,
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    if (!await geo.Geolocator.isLocationServiceEnabled()) return;

    var permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied ||
          permission == geo.LocationPermission.deniedForever) return;
    }

    final position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high);
    setState(() => _currentPosition = position);
    zoomToPosition(position);
  }


  void zoomToPosition(geo.Position position) {
    mapboxMap?.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(position.longitude, position.latitude),
        ),
        zoom: 15,
      ),
      MapAnimationOptions(duration: 1000),
    );
  }
}
