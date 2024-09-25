import 'package:flutter/material.dart';
import 'package:meal_go/order_track.dart';
import 'package:meal_go/screen/sign_in/sign_in_screen.dart';
import 'package:meal_go/home.dart';
import 'package:meal_go/screen/sign_in/sign_up_screen.dart';
import 'package:meal_go/search_food.dart';
import 'package:meal_go/cart.dart';
import 'package:meal_go/checkout.dart';
import 'package:meal_go/restaurant_home.dart';
import 'package:meal_go/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Go',
      debugShowCheckedModeBanner: false,

      home: OrderTrack(),
      //home: SignIn(),
      //home: CheckoutPage(),
      //home: const HomePage(),
      //home: RestaurantHome(),
      // routes: {
      //   '/backtohomepage': (context) => const HomePage(),
      //   '/searchfood': (context) => const SearchFood(),
      //   '/cartpage': (context) => CartPage(),
      // }
    );
  }
}
