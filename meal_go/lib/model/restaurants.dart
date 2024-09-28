import 'package:meal_go/model/restaurant_list.dart';

class RestaurantsModel {
  static final List<RestaurantListModel> lists = [
    RestaurantListModel(
        1, 'McDonalds', 'assets/images/restaurant/mcdonalds.jpeg'),
    RestaurantListModel(
        2, 'Burger King', 'assets/images/restaurant/burgerking.jpeg'),
    RestaurantListModel(3, 'A&W', 'assets/images/restaurant/aw.jpeg'),
    RestaurantListModel(4, 'KFC', 'assets/images/restaurant/kfc.jpeg'),
    RestaurantListModel(
        5, 'Emiya Kitchen', 'assets/images/restaurant/chaldea.jpeg'),
  ];
}
