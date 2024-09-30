import 'package:flutter/material.dart';
import 'package:meal_go/model/category.dart';
import 'package:meal_go/model/food.dart';

class MenuCatalogModel {
  static final List<Category> categories = [
    Category('Carbonara', [
      Food(1, 'Carbonara Beef No Drama', 'assets/images/menu/CarbonaraBeefNoDrama.webp', 10000),
      Food(2, 'Carbonara Chicken No Drama', 'assets/images/menu/CarbonaraChickenNoDrama.webp', 80000),
    ]),
    Category('Pizza', [
      Food(4, 'Deluxe Pizza', 'assets/images/menu/DeluxPizza.webp', 60000),
      Food(8, 'Signature Pizza', 'assets/images/menu/SignaturePizza.webp', 12000),
    ]),
    Category('Spaghetti', [
      Food(6, 'Spaghetti Bolognese', 'assets/images/menu/Mom\'sSpaghettiBolognese.webp', 70000),
      Food(9, 'Spaghetti Senk', 'assets/images/menu/Spaghetti-Senk.webp', 70000),
    ]),
    Category('Other', [
      Food(3, 'Cheese Please Fusilli', 'assets/images/menu/CheesePleaseFusilli.webp', 70000),
      Food(5, 'Mac Crunchy Chiz', 'assets/images/menu/MacCrunchyChiz.webp', 50000),
      Food(7, 'Shuffle Truffle', 'assets/images/menu/ShuffleTruffle.webp', 70000),
    ]),
  ];

  Food getById(int id) {
    return categories.expand((category) => category.foods).firstWhere(
          (food) => food.id == id,
          orElse: () => throw Exception('Food not found'),
        );
  }
}
