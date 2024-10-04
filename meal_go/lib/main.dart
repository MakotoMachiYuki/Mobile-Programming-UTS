import 'package:flutter/material.dart';
import 'package:meal_go/login_screen.dart';
import 'package:meal_go/sign_in_screen.dart';
import 'package:meal_go/sign_up_screen.dart';
import 'model/cart.dart';
import 'model/menuCatalog.dart';
import 'package:provider/provider.dart';
import 'package:meal_go/edit_profile.dart';
import 'package:meal_go/home.dart';
import 'package:meal_go/search_food.dart';
import 'package:meal_go/restaurant_list_screen.dart';
import 'package:meal_go/settings.dart';
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
      child: const MyApp(),
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
      //home: const SignIn(),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        '/backtohomepage': (context) => const HomePage(),
        '/searchfood': (context) => const SearchFood(),
        '/orderhistory': (context) => const OrderHistory(),
        '/address': (context) => const MyAddress(),
        '/users_profile': (context) => const UsersProfile(),
        '/settings': (context) => const Settings(),
        '/restaurantlist': (context) => const RestaurantList(),
        '/editprofile': (context) => EditProfile(),
        '/signin': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
        '/login': (context) => const Login(),
      },
    );
  }
}
