import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  final bool isDarkMode;
  final MapController mapController;

  const MapView({
    super.key,
    required this.isDarkMode,
    required this.mapController,
  });

  @override
  Widget build(BuildContext context) {
    // Aşgabat Merkezi
    final LatLng center = const LatLng(37.9601, 58.3261);

    // Light Mode üçin CartoDB Light (ýa-da OSM standart)
    // Dark Mode üçin CartoDB Dark
    final String urlTemplate = isDarkMode
        ? 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png'
        : 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png';

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: center,
        initialZoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: urlTemplate,
          subdomains: const ['a', 'b', 'c', 'd'],
        ),
        // Sürüjileri görkezmek üçin (Mysal)
        MarkerLayer(
          markers: [
            _buildDriverMarker(const LatLng(37.965, 58.330)),
            _buildDriverMarker(const LatLng(37.955, 58.320)),
          ],
        ),
        // Ulanyjynyň duran ýeri
        MarkerLayer(
          markers: [
            Marker(
              point: center,
              width: 80,
              height: 80,
              child: const Icon(
                Icons.location_on, 
                color: Colors.cyanAccent, 
                size: 50
              ),
            ),
          ],
        ),
      ],
    );
  }

  Marker _buildDriverMarker(LatLng point) {
    return Marker(
      point: point,
      width: 40,
      height: 40,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
             BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5)
          ]
        ),
        child: const Icon(Icons.local_taxi, size: 24, color: Colors.indigo),
      ),
    );
  }
}