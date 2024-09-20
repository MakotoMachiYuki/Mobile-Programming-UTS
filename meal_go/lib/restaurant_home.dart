import 'package:flutter/material.dart';

class RestaurantHome extends StatefulWidget {
  const RestaurantHome({super.key});

  @override
  State<RestaurantHome> createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome> {
  final Map<String, List<String>> menu = {
    'Popular': ['Nasi Goreng Noel', 'Onigiri', 'Watermelon Slice', 'ETC'],
    'Fruit': ['Melon', 'Grape', 'Watermelon'],
    'Pizza': ['Mushroom Pizza', 'Peperoni Pizza', 'Cheese Pizza'],
    'Desert': ['Ice Cream', 'Pancake', 'Cheese Cake'],
    'Drink': ['Water', 'Milk Shake', 'Coffee', 'Tea', 'Nutrisari', 'Pop Ice'],
  };

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

  void menuDetail(String item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    item,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This is my description about his menu i know this is few ingredients tthat can make this disk',
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 50,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    color: Colors.black,
                                    onPressed: () {},
                                    icon: Icon(Icons.plus_one),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  '00',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    color: Colors.black,
                                    onPressed: () {},
                                    icon: Icon(Icons.exposure_minus_1),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    'Add',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(width: 15),
                                  Icon(
                                    Icons.shopping_cart,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget showMenu(List<String> items) {
    return Column(
      children: items.map(
        (item) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  menuDetail(item);
                },
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      item,
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
        backgroundColor: Colors.amber,
        leading: !activeSearch
            ? IconButton(
                padding: EdgeInsets.all(8),
                onPressed: () {},
                iconSize: 20,
                icon: Icon(Icons.arrow_back_ios_new),
              )
            : null,
        title: activeSearch
            ? Container(
                height: 40,
                child: TextField(
                  controller: searching,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                  ),
                ),
              )
            : Text(
                'Store Name',
                style: TextStyle(fontSize: 20),
              ),
        actions: [
          IconButton(
            onPressed: () {
              toggleSearch();
            },
            iconSize: 25,
            icon: Icon(Icons.search),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 175,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.025,
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: menu.keys.map(
                (category) {
                  return ExpansionTile(
                    title: Text(
                      category,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [showMenu(menu[category]!)],
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
