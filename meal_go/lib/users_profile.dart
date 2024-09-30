import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersProfile extends StatelessWidget {
  const UsersProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.orange,
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        CupertinoIcons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Youremail@Untar.Ac.Id',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.pencil_ellipsis_rectangle,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(CupertinoIcons.cart),
                  title: const Text('Order History'),
                  trailing: const Icon(CupertinoIcons.chevron_forward),
                  onTap: () {
                    // navigasi page order history
                  },
                ),
                Divider(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  leading: const Icon(CupertinoIcons.location),
                  title: const Text('My Address'),
                  trailing: const Icon(CupertinoIcons.chevron_forward),
                  onTap: () {
                    // navigasi page my address
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
