import 'package:flutter/foundation.dart';
import 'package:meal_go/model/menuCatalog.dart';
import 'package:meal_go/model/food.dart';

class CartModel extends ChangeNotifier {
  late MenuCatalogModel cat;

  final Map<Food, int> foodList = {};

  MenuCatalogModel get catalog => cat;

  void initializeCatalog(MenuCatalogModel newCat) {
    cat = newCat;
    notifyListeners();
  }

  List<Food> get food => foodList.keys.toList();

  int get totalPrice => foodList.entries.fold(0, (total, entry) {
        return total + (entry.key.price * entry.value);
      });

  void add(Food food, int totalFood) {
    if (foodList.containsKey(food)) {
      foodList[food] = foodList[food]! + 1;
    } else {
      foodList[food] = totalFood;
    }
    notifyListeners();
  }

  void remove(Food food) {
    if (foodList.containsKey(food)) {
      if (foodList[food]! > 1) {
        foodList[food] = foodList[food]! - 1;
      } else {
        foodList.remove(food);
      }
    }
    notifyListeners();
  }

  bool isContain(Food food) {
    return foodList.containsKey(food);
  }

  int itemPerFood(Food food) {
    return foodList[food] ?? 0;
  }
}
