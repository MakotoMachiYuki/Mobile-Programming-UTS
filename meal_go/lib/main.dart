import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meal_go/order_track.dart';
import 'package:meal_go/screen/sign_in/sign_in_screen.dart';
import 'package:meal_go/cart.dart';
import 'package:meal_go/home.dart';
import 'package:meal_go/search_food.dart';
import 'package:meal_go/cart.dart';
import 'package:meal_go/checkout.dart';
import 'package:meal_go/restaurant_list_screen.dart';
import 'package:meal_go/orderplaced.dart';
import 'package:meal_go/restaurant_home.dart';
import 'package:meal_go/settings.dart';
// import 'restaurant_menu.dart';
import 'model/cart.dart';
import 'model/menuCatalog.dart';
import 'package:meal_go/users_address.dart';
import 'package:meal_go/users_history.dart';
import 'package:meal_go/users_profile.dart';

void main() {
  final menuCatalog = MenuCatalogModel();
  final cartModel = CartModel();

  cartModel.initializeCatalog(menuCatalog);

  runApp(
    ChangeNotifierProvider<CartModel>(
      create: (context) => cartModel,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      title: 'Meal Go',
      debugShowCheckedModeBanner: false,

      // home: OrderTrack(),
      // home: SignIn(),
      // home: CheckoutPage(),
      // home: const HomePage(),
      home: RestaurantList(),
      // home: RestaurantHome(),
      // home: Settings(),
      // home: Settings(),
      // home: RestaurantHome(),
      // home: UsersProfile(),
      routes: {
        // '/orderplaced': (context) => const OrderPlacedPage(),
        '/backtohomepage': (context) => HomePage(),
        '/searchfood': (context) => const SearchFood(),
        // '/cartpage': (context) => CartPage(),
        '/orderhistory': (context) => OrderHistory(),
        '/address': (context) => MyAddress(),
      },
    );
  }
}
