import 'package:flutter/material.dart';
import 'package:meal_go/cart.dart';
import 'package:meal_go/edit_profile.dart';
import 'package:meal_go/home.dart';
import 'package:meal_go/search_food.dart';
import 'package:meal_go/users_address.dart';
import 'package:meal_go/users_history.dart';
import 'package:meal_go/users_profile.dart';

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
      home: UsersProfile(),
      routes: {
        '/backtohomepage': (context) => HomePage(),
        '/searchfood': (context) => const SearchFood(),
        '/cartpage': (context) => CartPage(),
        '/orderhistory': (context) => OrderHistory(),
        '/address': (context) => MyAddress(),
        '/editprofile': (context) => EditProfile(),
      },
    );
  }
}
