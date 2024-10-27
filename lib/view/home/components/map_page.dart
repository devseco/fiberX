import 'package:fiber/config/const_wodget/custom_fill_button.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  AuthController authController = Get.find();
  late GoogleMapController _mapController;
  late LatLng _currentPosition; // Default to San Francisco

  @override
  void initState() {
    super.initState();

    _currentPosition =
        LatLng(authController.lattitude.value, authController.longitude.value);
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _currentPosition = position.target;
      authController.lattitude.value = position.target.latitude;
      authController.longitude.value = position.target.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تحديد الموقع'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('selected-location'),
                position: _currentPosition,
                draggable: true,
                onDragEnd: (LatLng newPosition) {
                  setState(() {
                    _currentPosition = newPosition;
                  });
                },
              ),
            },
            onCameraMove: _onCameraMove,
          ),
          Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(Insets.margin),
                width: MediaQuery.of(context).size.width,
                child: CustomFillButton(
                  onTap: () {
                    authController.locationSelected.value = true;

                    Get.back();
                  },
                  title: "تأكيد النقطة",
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              )),
        ],
      ),
    );
  }
}
