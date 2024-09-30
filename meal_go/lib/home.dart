import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:meal_go/drawerwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLovedPopular = <bool>[false, false, false, false];
  var isLovedRecommended = <bool>[false, false, false, false];
  var isIncart = <bool>[false, false, false, false];

  List<Map<String, String>> popularList = [
    {
      "image": "assets/chickenpizza.png",
      "name": "Chicken Pizza",
      "description": "Potongan ayam, sayuran dan saos",
      "price": "Rp 80.000"
    },
    {
      "image": "assets/steak.png",
      "name": "Steak",
      "description": "Steak dengan saos barbeque",
      "price": "Rp 120.000"
    },
    {
      "image": "assets/miegoreng.png",
      "name": "Mie Goreng",
      "description": "Mie, telur, sayuran dan seafood",
      "price": "Rp 20.000"
    },
    {
      "image": "assets/cupcakes.png",
      "name": "CupCakes",
      "description": "CupCakes dengan rasa strawberry",
      "price": "Rp 15.000"
    },
  ];

  List<Map<String, String>> recommendedList = [
    {
      "image": "assets/cheeseburger.png",
      "name": "Cheese Burger",
      "description": "Roti, Telur, daging, cheese",
      "price": "Rp 45.000"
    },
    {
      "image": "assets/pancake.png",
      "name": "Pancake",
      "description": "Pancake dengan madu dan bluberry diatasnya",
      "price": "Rp 55.000"
    },
    {
      "image": "assets/ricebowl.png",
      "name": "Rice Bowl",
      "description": "Nasi dengan campuran bihun, ayam dan sayuran",
      "price": "Rp 25.000"
    },
    {
      "image": "assets/pasta.png",
      "name": "Pasta",
      "description": "Pasta dengan saos carbonara",
      "price": "Rp 33.000"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerWidget(),
      body: ListView(
        children: [
          // App Bar Widget
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: Icon(CupertinoIcons.bars)),
                    );
                  },
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Icon(Icons.notifications)),
                )
              ],
            ),
          ),

          // Search
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/searchfood');
              },
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
                      )
                    ]),
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
                            onTap: () {
                              Navigator.pushNamed(context, '/searchfood');
                            },
                            onFieldSubmitted: (value) {
                              Navigator.pushNamed(context, '/searchfood');
                            },
                            decoration: const InputDecoration(
                              hintText: "Mau mamam apa hari ini?",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.filter_list),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // category
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          //categories widget
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Image.asset(
                        "assets/burger.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Image.asset(
                        "assets/donat.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Image.asset(
                        "assets/pizza.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Image.asset(
                        "assets/cola.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Image.asset(
                        "assets/kentang.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Deals section
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Colors.orange, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 170,
                          child: Text("Special Deals \nFor Today",
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        SizedBox(height: 6),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: Size(60, 30),
                          ),
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/deals.png',
                    height: 120,
                    width: 120,
                  ),
                )
              ],
            ),
          ),

          // Popular Items
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Popular",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          // Popular items widget
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              child: Row(
                  children: List.generate(isLovedPopular.length, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Container(
                    width: 160,
                    height: 225,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              popularList[index]["image"]!,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            popularList[index]["name"]!,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            popularList[index]["description"]!,
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                popularList[index]["price"]!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLovedPopular[index] =
                                        !isLovedPopular[index];
                                  });
                                },
                                child: Icon(
                                    isLovedPopular[index]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isLovedPopular[index]
                                        ? Colors.red
                                        : Colors.orange,
                                    size: 26),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
            ),
          ),

          //Recommended for you item
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Recommended For You",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: List.generate(recommendedList.length, (index) {
                return buildRecommendedItem(
                  context,
                  index,
                  recommendedList[index]["name"]!,
                  recommendedList[index]["description"]!,
                  recommendedList[index]["price"]!,
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
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
        child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            child: Icon(CupertinoIcons.cart, size: 28, color: Colors.orange),
            backgroundColor: Colors.white),
      ),
    );
  }

  Padding buildRecommendedItem(BuildContext context, int index, String itemName,
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
                  recommendedList[index]["image"]!,
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
                          isLovedRecommended[index] =
                              !isLovedRecommended[index];
                        },
                      );
                    },
                    child: Icon(
                        isLovedRecommended[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isLovedRecommended[index]
                            ? Colors.red
                            : Colors.orange,
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

extension on ScaffoldMessengerState {
  void openDrawer() {}
}
