import 'package:meal_go/model/restaurant_list.dart';

class RestaurantsModel {
  static final List<RestaurantListModel> lists = [
    RestaurantListModel(
        1,
        'McDonalds',
        'assets/images/restaurant/mcdonalds.jpeg',
        -6.126297773216025,
        106.71427667019422),
    RestaurantListModel(
        2,
        'Burger King',
        'assets/images/restaurant/burgerking.jpeg',
        -6.1388418951299375,
        106.72964034547913),
    RestaurantListModel(3, 'A&W', 'assets/images/restaurant/aw.jpeg',
        -6.153483367738778, 106.79675996047858),
    RestaurantListModel(4, 'KFC', 'assets/images/restaurant/kfc.jpeg',
        -6.182658240515656, 106.73895127686004),
    RestaurantListModel(
        5,
        'Emiya Kitchen',
        'assets/images/restaurant/chaldea.jpeg',
        -6.168337316691201,
        106.78408367206184),
  ];
}
