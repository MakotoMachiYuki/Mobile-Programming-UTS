import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.all(10),
          onPressed: () {},
          iconSize: 15,
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Go Meal',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 44,
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Notifications'),
            subtitle: Text('Enable to receive notifications'),
            activeColor: Colors.amber,
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            subtitle: Text('Enable dark mode'),
            value: _darkModeEnabled,
            activeColor: Colors.black,
            inactiveThumbColor: Colors.grey,
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.wallet),
            title: Text('Payment Method'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              //buat refer ke pagenya
            },
          ),
          ListTile(
            leading: Icon(Icons.import_contacts),
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              //buat refer ke pagenya
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              //buat refer ke pagenya
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '© 2024 Go Meal. All rights reserved.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
