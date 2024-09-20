import 'package:flutter/material.dart';

class RestaurantSearch extends StatefulWidget {
  const RestaurantSearch({super.key});

  @override
  State<RestaurantSearch> createState() => _RestaurantSearchState();
}

class _RestaurantSearchState extends State<RestaurantSearch> {
  final List<String> category = ['Food', 'Drink', 'Beferage', 'other'];
  bool activedCategory = false;
  FocusNode focusedFieldText = FocusNode();

  @override
  void initState() {
    super.initState();
    focusedFieldText.addListener(() {
      if (focusedFieldText.hasFocus) {
        setState(() {
          activedCategory = true;
        });
      } else {
        setState(() {
          activedCategory = false;
        });
      }
    });
  }

  @override
  void dispose() {
    focusedFieldText.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.all(10),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 15,
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Go Meal',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 40,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 225,
                  height: 40,
                  child: TextField(
                    focusNode: focusedFieldText,
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: 'Input Here',
                      labelStyle: TextStyle(fontSize: 14),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.search,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
            if (activedCategory)
              SizedBox(
                height: 50,
                child: Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: category.map(
                        (cat) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 2),
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    cat,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
