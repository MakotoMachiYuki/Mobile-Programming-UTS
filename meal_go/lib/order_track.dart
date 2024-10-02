import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:meal_go/api.dart';
import 'package:meal_go/home.dart';
import 'package:meal_go/model/cart.dart';
import 'package:meal_go/model/menuCatalog.dart';
import 'package:meal_go/model/restaurants.dart';
import 'package:meal_go/rating.dart';
import 'location.dart';
import "package:http/http.dart" as http;
import 'package:meal_go/model/restaurant_list.dart';

class OrderTrack extends StatefulWidget {
  final RestaurantListModel restaurant;
  final CartModel cart;
  const OrderTrack({super.key, required this.restaurant, required this.cart});

  @override
  State<OrderTrack> createState() => _OrderDetailstate();
}

class _OrderDetailstate extends State<OrderTrack> {
  LocationService locationService = LocationService();
  double lat = 0.0;
  double lng = 0.0;
  double lat1 = 0.0;
  double lng1 = 0.0;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    lat1 = widget.restaurant.latitude;
    lng1 = widget.restaurant.longitude;

    getlocation();
  }

  Future<void> getlocation() async {
    await locationService.getCurrentLocation();
    setState(() {
      lat = locationService.lat;
      lng = locationService.lng;
      loading = false;
    });
    getCoordinates();
  }

  List listPoints = [];

  List<LatLng> Points = [];

  getCoordinates() async {
    var response = await http.get(getRouteurl("$lng,$lat", "$lng1,$lat1"));

    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        listPoints = data['features'][0]['geometry']['coordinates'];
        Points = listPoints
            .map((e) => LatLng(e[1].toDouble(), e[0].toDouble()))
            .toList();
      }
    });
  }

  List<Widget> buildOrderItems() {
    return widget.cart.food.map((item) {
      return ListTile(
        leading: Icon(Icons.food_bank),
        title: Text(item.name),
        subtitle: Text("Jumlah: ${widget.cart.itemPerFood(item)}"),
        trailing: Text("Rp ${item.price * widget.cart.itemPerFood(item)}"),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.all(10),
          onPressed: () {
            Navigator.pop(context);
          },
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
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    center: LatLng(lat, lng),
                    zoom: 13.2,
                    maxZoom: 18,
                    minZoom: 10,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(lat, lng),
                          width: 80,
                          height: 80,
                          builder: (context) => Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                        Marker(
                          point: LatLng(lat1, lng1),
                          width: 80,
                          height: 80,
                          builder: (context) => Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    PolylineLayer(
                      polylineCulling: false,
                      polylines: [
                        Polyline(
                            points: Points, color: Colors.blue, strokeWidth: 5),
                      ],
                    )
                  ],
                ),
                SizedBox.expand(
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.22,
                    minChildSize: 0.22,
                    maxChildSize: 0.8,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          border: Border.all(
                            color: Color.fromARGB(255, 253, 224, 171),
                            width: 10,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                            )
                          ],
                        ),
                        child: ListView(
                          controller: scrollController,
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 8,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 70,
                                  backgroundImage: NetworkImage(
                                      'https://i.ebayimg.com/images/g/B~gAAOSwhNthhdjn/s-l1200.jpg'),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Driver : Henry',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 16),
                                        SizedBox(width: 5),
                                        Text(
                                          '4.8 (120 reviews)',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Vehicle: Honda Vario - BXXXXAAA',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Order Details",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            ListTile(
                              leading: Icon(Icons.restaurant_menu),
                              title:
                                  Text("Restaurant: ${widget.restaurant.name}"),
                              subtitle: Text("Estimated delivery time: 15 min"),
                            ),
                            ...buildOrderItems(),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Rating()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 253, 224, 171),
                              ),
                              child: const Text(
                                'Finish Order',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 53, 53, 53),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 166, 0),
                              ),
                              child: const Text(
                                'Cancel Order',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 53, 53, 53),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
