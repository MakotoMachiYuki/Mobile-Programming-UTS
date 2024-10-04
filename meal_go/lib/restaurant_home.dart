import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_go/home.dart';
import 'package:meal_go/model/restaurant_list.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'model/menuCatalog.dart';
import 'model/food.dart';
import 'model/cart.dart';

class AddToCart extends StatelessWidget {
  final Food food;
  final int totalFood;

  const AddToCart({super.key, required this.food, required this.totalFood});

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.isContain(food),
    );

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              var cart = context.read<CartModel>();
              cart.add(food, totalFood);
            },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>((state) {
            return Colors.orange;
          }),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.orange;
              }
              return null;
            },
          ),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.black)),
      child: SizedBox(
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            isInCart
                ? const Icon(Icons.check, semanticLabel: 'ADDED')
                : const Icon(
                    Icons.shopping_cart_outlined,
                    semanticLabel: 'ADD',
                  ),
            isInCart ? const Text('ADDED') : const Text('ADD'),
          ],
        ),
      ),
    );
  }
}

class RestaurantHome extends StatefulWidget {
  final RestaurantListModel restaurant;

  const RestaurantHome({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<RestaurantHome> createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome> {
  final TextEditingController searching = TextEditingController();
  bool activeSearch = false;
  Map<String, int> totalProductPerItem = {};
  List<Food> filteredFoods = [];
  final int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    for (var category in MenuCatalogModel.categories) {
      for (var food in category.foods) {
        totalProductPerItem[food.name] = 1;
      }
    }
    filteredFoods = MenuCatalogModel.categories
        .expand((category) => category.foods)
        .toList();
  }

  void increment(String item) {
    setState(() {
      totalProductPerItem[item] = (totalProductPerItem[item] ?? 0) + 1;
    });
  }

  void decrement(String item) {
    setState(() {
      if ((totalProductPerItem[item] ?? 0) > 0) {
        totalProductPerItem[item] = totalProductPerItem[item]! - 1;
      }
      if (totalProductPerItem[item] == 0) {
        totalProductPerItem[item] = 1;
      }
    });
  }

  void toggleSearch() {
    setState(() {
      activeSearch = !activeSearch;
      if (!activeSearch) {
        searching.clear();
        filteredFoods = MenuCatalogModel.categories
            .expand((category) => category.foods)
            .toList();
      }
    });
  }

  void menuDetail(Food food) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        var isInCart = context.select<CartModel, bool>(
          (cart) => cart.isContain(food),
        );
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return FractionallySizedBox(
              heightFactor: 0.9,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        food.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          food.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          'This is my description about his menu i know this is few ingredients that can make this disk'),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        color: Colors.black,
                                        onPressed: isInCart
                                            ? null
                                            : () {
                                                setModalState(() {
                                                  decrement(food.name);
                                                });
                                              },
                                        icon:
                                            const Icon(Icons.exposure_minus_1),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      (totalProductPerItem[food.name] ?? 0 + 1)
                                          .toString()
                                          .padLeft(2, '0'),
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        color: Colors.black,
                                        onPressed: isInCart
                                            ? null
                                            : () {
                                                setModalState(() {
                                                  increment(food.name);
                                                });
                                              },
                                        icon: const Icon(Icons.plus_one),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AddToCart(
                                  food: food,
                                  totalFood:
                                      totalProductPerItem[food.name] ?? 0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget showMenu(List<Food> foods) {
    return Column(
      children: foods.map(
        (food) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => menuDetail(food),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 3),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(food.image), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              food.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Rp. ${food.price}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        title: activeSearch
            ? TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              )
            : Text(
                widget.restaurant.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
        leading: IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/restaurantlist');
            }),
        actions: [
          IconButton(
            onPressed: toggleSearch,
            iconSize: 25,
            color: Colors.black,
            icon: Icon(Icons.search),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 175,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.restaurant.image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.025,
                    bottom: 0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF333333).withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.restaurant.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF333333)
                                            .withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('5.0'),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          5,
                                          (index) => const Icon(
                                            Icons.star,
                                            size: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Icon(Icons.motorcycle),
                                      SizedBox(height: 7),
                                      Text('20 min')
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Icon(Icons.location_on),
                                      SizedBox(height: 7),
                                      Text('10 km')
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Icon(Icons.av_timer),
                                      SizedBox(height: 7),
                                      Text('10 - 15 min')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: MenuCatalogModel.categories.map(
                (category) {
                  return ExpansionTile(
                    title: Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      showMenu(category.foods),
                    ],
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.orange,
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Restaurants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/backtohomepage');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/restaurantlist');
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CartPage(restaurant: widget.restaurant)),
            );
          }
        },
      ),
    );
  }
}
