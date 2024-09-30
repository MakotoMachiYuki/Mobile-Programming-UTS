import 'package:flutter/material.dart';
import 'package:meal_go/model/menuCatalog.dart';
import 'package:meal_go/model/restaurants.dart';
import 'package:meal_go/restaurant_home.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  final TextEditingController searching = TextEditingController();
  bool activeSearch = false;

  void toggleSearch() {
    setState(() {
      activeSearch = !activeSearch;
      if (!activeSearch) {
        searching.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFA500),
        leading: !activeSearch
            ? IconButton(
                padding: const EdgeInsets.all(8),
                onPressed: () {
                  Navigator.pushNamed(context, '/backtohomepage');
                },
                iconSize: 20,
                icon: const Icon(Icons.arrow_back_ios_new),
              )
            : null,
        title: activeSearch
            ? TextField(
                controller: searching,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              )
            : const Text(
                'Restaurants',
                style: TextStyle(fontSize: 20),
              ),
        actions: [
          IconButton(
            onPressed: toggleSearch,
            iconSize: 25,
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Popular Restaurant',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.06,
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: RestaurantsModel.lists.length,
              itemBuilder: (context, index) {
                final restaurant = RestaurantsModel.lists[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RestaurantHome(restaurant: restaurant),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenWidth * 0.4,
                              height: screenHeight * 0.2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(restaurant.image),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.04,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'This is a random text that stores some useful information.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        onTap: (index) {},
      ),
    );
  }
}
