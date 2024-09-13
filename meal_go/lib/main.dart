import 'package:flutter/material.dart';
import 'package:meal_go/restaurant.dart';
import 'package:meal_go/order_track.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Meal Go',
      debugShowCheckedModeBanner: false,
      // home: StoreDetail(),
      home: OrderTrack(),
    );
  }
}
