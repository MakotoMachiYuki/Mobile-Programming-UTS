import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchFood extends StatefulWidget {
  const SearchFood({super.key});

  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  var isLoved = <bool>[false, false, false, false];
  var isIncart = <bool>[false, false, false, false];

  List<Map<String, String>> recentorderList = [
    {
      "image": "assets/sandwich.png",
      "name": "Sandwich",
      "description":
          "Sandwich dengan campuran sayuran, ayam dan saos didalamnya",
      "price": "Rp 30.000"
    },
    {
      "image": "assets/salad.png",
      "name": "Salad",
      "description": "Campuran berbagai macam sayuran dengan saos salad",
      "price": "Rp 26.000"
    },
    {
      "image": "assets/chickenwings.png",
      "name": "Chicken Wings",
      "description": "Wings dengan saos pedas",
      "price": "Rp 45.000"
    },
    {
      "image": "assets/thaisoup.png",
      "name": "Thai Soup",
      "description": "Soup tomyam dengan campuran seafood didalamnya",
      "price": "Rp 50.000"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Go Meal",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Search
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.search, color: Colors.orange),
                      Container(
                        height: 50,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Mau mamam apa hari ini?",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Recent Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recent Search",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: [
                      _buildSearchFoodChip("Burger"),
                      _buildSearchFoodChip("Soup"),
                      _buildSearchFoodChip("Ayam"),
                      _buildSearchFoodChip("Salad"),
                      _buildSearchFoodChip("Katsu"),
                      _buildSearchFoodChip("Rice Bowl"),
                      _buildSearchFoodChip("Pizza"),
                    ],
                  ),
                ],
              ),
            ),

            //popular
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Popular Search",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: [
                      _buildSearchFoodChip("Pizza"),
                      _buildSearchFoodChip("Pasta"),
                      _buildSearchFoodChip("Soup"),
                      _buildSearchFoodChip("salad"),
                      _buildSearchFoodChip("Chicken"),
                      _buildSearchFoodChip("Cheese Burger"),
                      _buildSearchFoodChip("Spaghetti"),
                    ],
                  ),
                ],
              ),
            ),

            //Recent Order
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Order",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: List.generate(recentorderList.length, (index) {
                  return buildRecentOrderItem(
                    context,
                    index,
                    recentorderList[index]["name"]!,
                    recentorderList[index]["description"]!,
                    recentorderList[index]["price"]!,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildRecentOrderItem(BuildContext context, int index, String itemName,
      String description, String price) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 380,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  recentorderList[index]["image"]!,
                  height: 120,
                  width: 150,
                ),
              ),
            ),
            Container(
              width: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    itemName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 18,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    onRatingUpdate: (index) {},
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          isLoved[index] = !isLoved[index];
                        },
                      );
                    },
                    child: Icon(
                        isLoved[index] ? Icons.favorite : Icons.favorite_border,
                        color: isLoved[index] ? Colors.red : Colors.orange,
                        size: 26),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Ditambahkan ke keranjang!"),
                        ),
                      );
                    },
                    child: const Icon(CupertinoIcons.cart,
                        color: Colors.orange, size: 26),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSearchFoodChip(String label) {
  return Chip(
    label: Text(label),
    backgroundColor: Colors.orangeAccent,
    labelStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  );
}
