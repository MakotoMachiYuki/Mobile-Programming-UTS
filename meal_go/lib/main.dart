import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:meal_go/restaurant.dart';
import 'package:meal_go/settings.dart';
=======
import 'package:meal_go/users_address.dart';
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
      home: Settings(),
=======

      //home: OrderTrack(),
      // home: SignIn(),
      // home: UsersProfile(),
      home: UsersAddress(),
      //home: CheckoutPage(),
      //home: const HomePage(),
      //home: RestaurantHome(),
      // routes: {
      //   '/backtohomepage': (context) => const HomePage(),
      //   '/searchfood': (context) => const SearchFood(),
      //   '/cartpage': (context) => CartPage(),
      // }
>>>>>>> Stashed changes
    );
  }
}
