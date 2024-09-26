import 'package:flutter/material.dart';
import 'package:meal_go/users_history.dart';

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

      //home: OrderTrack(),
      // home: SignIn(),
      // home: UsersProfile(),
      home: OrderHistory(),
      //home: UsersAddress(),
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
