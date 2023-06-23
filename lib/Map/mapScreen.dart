import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insuranceapp/chatbot/chatbotConstants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder2/geocoder2.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final CameraPosition _initialCameraPosition =
      const CameraPosition(target: LatLng(23.7945814, 90.3369494), zoom: 14);

  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> marker = {};

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  var lat;
  var long;
  String? dataAddress;

  Future getCurrentPosition() async {
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });

    var Address = await Geocoder2.getDataFromCoordinates(
        latitude: position.latitude,
        longitude: position.longitude,
        googleMapApiKey: "AIzaSyBNbnHyNyxEiZMIlYb0FyzOhNZE22HhB5c");

    print("${position.latitude}");
    print("${position.longitude}");
    print("${Address}");
    setState(() {
      marker.add(
        Marker(
            infoWindow: InfoWindow(title: dataAddress.toString() ?? 'Loading'),
            markerId: const MarkerId("1"),
            position: LatLng(position.latitude, position.longitude)),
      );
    });

    dataAddress = Address.address;
    final CameraPosition currentPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 14);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(currentPosition));
  }

  @override
  void initState() {
    setState(() {
      getCurrentPosition();
    });
    _determinePosition();

    super.initState();
  }

  CollectionReference pids =
      FirebaseFirestore.instance.collection('ambulanceService');

  Future<void> addLocation() async {
    return pids
        .add({
          'towingServiceAddress': dataAddress,
          // 'image url': url,
          // 'score': score,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  final String loading = "Loading";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text('Ambulance service'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            markers: marker,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              setState(() {
                getCurrentPosition();
              });
            },
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(8),
                  color: Colors.lightBlue.shade200,
                  child: Text('${dataAddress ?? 'Loading'}'),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.all(16.0),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(200.0, 60.0),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kAppBarColor),
                  ),
                  onPressed: () {
                    addLocation();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: kAppBarColor.withOpacity(.9),
                          title: Text('Response noted. '),
                          content: Text(
                              'Ambulance is coming to your location soon.'),
                          actions: [
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.lightBlue)),
                              onPressed: () {
                                // Perform actions when the button is clicked
                                // You can close the popup box or perform any desired action here
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Back to Home',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Share location',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
