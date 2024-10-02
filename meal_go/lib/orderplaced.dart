import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meal_go/cart.dart';
import 'package:meal_go/model/cart.dart';
import 'package:meal_go/model/menuCatalog.dart';
import 'package:meal_go/model/restaurants.dart';
import 'package:meal_go/order_track.dart';
import 'package:meal_go/model/restaurant_list.dart';

class OrderPlacedPage extends StatelessWidget {
  final RestaurantListModel restaurant;
  final CartModel cart;
  const OrderPlacedPage({Key? key, required this.restaurant, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.orange),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          restaurant.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/order.png',
                    width: 235,
                    height: 231,
                  ),
                ),
                const Text(
                  'Order Placed!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: Text(
                    "Good news my friend. Your order #211245870 has been placed",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OrderTrack(restaurant: restaurant, cart: cart)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Track Your Order",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
