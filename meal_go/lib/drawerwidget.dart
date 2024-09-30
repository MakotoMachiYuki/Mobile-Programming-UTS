import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              margin: EdgeInsets.only(bottom: 0),
              accountName: Text(
                "Meal Go",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              accountEmail: Text(
                "mealgo@gmail.com",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/avatar.png"),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.person_fill,
              color: Colors.orange,
            ),
            title: const Text(
              "Profile",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/users_profile');
            },
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.heart_fill,
              color: Colors.orange,
            ),
            title: Text(
              "My Wish List",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.orange,
            ),
            title: Text(
              "Current Orders",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.settings,
              color: Colors.orange,
            ),
            title: const Text(
              "Settings",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
