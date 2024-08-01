import 'package:flutter/material.dart';
import '/core/app_export.dart';

class GoogleMaps extends StatefulWidget {
  final void Function(LatLng) onChangeLocation;
  const GoogleMaps({super.key, required this.onChangeLocation});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  GoogleMapController? mapController;
  Marker? markers;
  LatLng target = const LatLng(45.521563, -122.677433);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;

    getCurrentLocation().then((position) {
      target = LatLng(position.latitude, position.longitude);
      widget.onChangeLocation(target);

      markers = Marker(
        markerId: const MarkerId("target"),
        position: target,
        infoWindow: const InfoWindow(title: 'Current Position'),
      );

      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: target,
            zoom: 15.0,
          ),
        ),
      );

      setState(() {});
    });
  }

  void onCameraMove(CameraPosition position) {
    target = position.target;
    widget.onChangeLocation(target);

    markers = Marker(
      markerId: const MarkerId("target"),
      position: target,
      infoWindow: const InfoWindow(title: 'Moving Marker'),
    );

    setState(() {});
  }

  Future<Position> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      Position position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          compassEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: onMapCreated,
          onCameraMove: onCameraMove,
          myLocationButtonEnabled: true,
          markers: markers != null ? {markers!} : {},
          initialCameraPosition: CameraPosition(
            target: target,
            zoom: 14.0,
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: IconButton(
            onPressed: () {
              getCurrentLocation().then((position) {
                widget.onChangeLocation(
                  LatLng(
                    position.latitude,
                    position.longitude,
                  ),
                );

                target = LatLng(position.latitude, position.longitude);

                markers = Marker(
                  markerId: const MarkerId("target"),
                  position: target,
                  infoWindow: const InfoWindow(title: 'Current Position'),
                );

                mapController?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: target,
                      zoom: 15.0,
                    ),
                  ),
                );

                setState(() {});
              });
            },
            icon: const Icon(Icons.location_on),
          ),
        ),
      ],
    );
  }
}
