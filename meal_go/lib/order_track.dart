import 'package:flutter/material.dart';
import 'location.dart';

class OrderTrack extends StatefulWidget {
  const OrderTrack({super.key});

  @override
  State<OrderTrack> createState() => _OrderDetailstate();
}

class _OrderDetailstate extends State<OrderTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.all(10),
          onPressed: () {},
          iconSize: 15,
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Go Meal',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 40,
        backgroundColor: const Color.fromARGB(255, 253, 224, 171),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});
  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  LocationService locationService = LocationService();
  double lat = 0.0;
  double lng = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lat: $lat'),
              Text('Lng: $lng'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await locationService.getCurrentLocation();
          setState(() {
            lat = locationService.lat;
            lng = locationService.lng;
          });
        },
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
