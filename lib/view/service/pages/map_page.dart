import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/locations/location_controller.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LocationsController locationsController = Get.put(LocationsController());
  late LatLng _currentPosition = LatLng(33.2984442, 44.3331072);
  // list of set of markers
  Set<Marker> markers = {};
  late GoogleMapController mapController;

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      print("loooooooooooooooooooooooooooo");
      print(_currentPosition);
    });
  }

  Future<void> _requestPermissionAndGetLocation() async {
    // Request location permission
    var status = await Permission.locationWhenInUse.request();

    if (status == PermissionStatus.granted) {
      // Permission granted, get location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("okkkkkkkkkkkkkkkkkk");

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 14,
          ),
        ),
      );

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
    } else if (status == PermissionStatus.denied) {
      var r = await Permission.locationWhenInUse.request();
    } else if (status == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    _requestPermissionAndGetLocation();

    locationsController.getData().then((value) {
      print(value);
      for (var i = 0; i < value.length; i++) {
        setState(() {
          markers.add(
            Marker(
              markerId: MarkerId(value[i].id.toString()),
              position: LatLng(double.parse(value[i].lat.toString()),
                  double.parse(value[i].long.toString())),
              infoWindow: InfoWindow(
                title: value[i].name,
              ),
            ),
          );
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        leadingWidth: 65,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(Insets.margin),
            const CustomBackButton(),
          ],
        ),
        title: Text(
          "مواقعنا والتغطية".tr,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(target: _currentPosition, zoom: 14),
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            controller.setMapStyle(Get.isDarkMode
                ? """
                [
      {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
      },
      {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
      },
      {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
      },
      {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
      },
      {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
      },
      {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
      },
      {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
      },
      {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
      },
      {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
      },
      {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#181818"
      }
    ]
      },
      {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
      },
      {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1b1b1b"
      }
    ]
      },
      {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2c2c2c"
      }
    ]
      },
      {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8a8a8a"
      }
    ]
      },
      {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#373737"
      }
    ]
      },
      {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3c3c3c"
      }
    ]
      },
      {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#4e4e4e"
      }
    ]
      },
      {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
      },
      {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
      },
      {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#592D96" 
      },
      {
        "saturation": 1
      },
      {
        "lightness": 10 
      },
      {
        "gamma": 0.5
      }
    ]
      },
      {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#592D96"
      }
    ]
      }
    ]
    """
                    .toString()
                : """
           [
            {
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#f5f5f5"
            }
          ]
            },
            {
          "featureType": "road",
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#592D96"
            },
            {
              "saturation": 10
            },
            {
              "lightness": 90
            },
            {
              "gamma": 0.5
            }
          ]
            },
            {
          "featureType": "water",
          "elementType": "geometry",
          "stylers": [
              {
              "color": "#592D96" 
            },
            {
              "saturation": 1
            },
            {
              "lightness": 70 
            },
            {
              "gamma": 0.5
            }
            
            
          
          ]
            },
            {
          "featureType": "water",
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "color": "#592D96"
            }
            
          ]
            }
          ]
          """);
            // controller.animateCamera(
            //   CameraUpdate.newLatLngZoom(
            //     LatLng(
            //         double.parse(
            //             (carController.paths.value.fromGarageLat ??
            //                     33.3152)
            //                 .toString()),
            //         double.parse(
            //             (carController.paths.value.fromGarageLng ??
            //                     44.3661)
            //                 .toString())),
            //     zoomLevel - 1.1,
            //   ),
            // );
          },
          mapToolbarEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          markers: markers,
        ),
      ),
    );
  }
}
