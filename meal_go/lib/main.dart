import 'package:flutter/material.dart';
import 'package:meal_go/home.dart';
import 'package:meal_go/restaurant.dart';
import 'package:meal_go/search_food.dart';
import 'package:meal_go/cart.dart';

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
        home: const HomePage(),
        routes: {
          '/backtohomepage': (context) => const HomePage(),
          '/searchfood': (context) => const SearchFood(),
          '/cartpage': (context) => CartPage(),
        });
  }
}
