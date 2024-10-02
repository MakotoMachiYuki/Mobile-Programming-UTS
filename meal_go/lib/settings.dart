import 'package:flutter/material.dart';
import 'package:meal_go/home.dart';
import 'package:meal_go/screen/sign_in/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'privacypolicy.dart';
import 'changepasswordpage.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notificationsEnabled = false;
  bool _darkModeEnabled = false;
  List<String> selectedPaymentMethods = [];
  bool _policyAccepted = false;
  bool _prefsLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadPolicyStatus();
  }

  Future<void> _loadPolicyStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _policyAccepted = prefs.getBool('privacy_policy_accepted') ?? false;
        _prefsLoaded = true;
      });
    } catch (e) {
      print('Error loading your preferences: $e');
      setState(() {
        _prefsLoaded = true;
      });
    }
  }

  void _showNotificationSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Notifications Turned On',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.orange.shade100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.all(10),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          iconSize: 15,
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Go Meal',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 44,
        backgroundColor: Colors.orange.shade100,
      ),
      body: _prefsLoaded
          ? ListView(
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
                    if (value) {
                      _showNotificationSnackbar();
                    }
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
                  subtitle: Text(selectedPaymentMethods.isEmpty
                      ? 'None'
                      : selectedPaymentMethods.join(', ')),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () async {
                    List<String>? methods = await showDialog<List<String>>(
                      context: context,
                      builder: (BuildContext context) {
                        return _MultiSelectDialog(
                          selectedMethods: selectedPaymentMethods,
                        );
                      },
                    );

                    if (methods != null) {
                      setState(() {
                        selectedPaymentMethods = methods;
                      });
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.import_contacts),
                  title: Text('Privacy Policy'),
                  subtitle: Text(_policyAccepted ? 'Accepted' : 'Not accepted'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () async {
                    final result = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacyPolicyPage()),
                    );
                    if (result != null) {
                      setState(() {
                        _policyAccepted = result;
                      });
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Change Password'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Log Out'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () async {
                    final result = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
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
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class _MultiSelectDialog extends StatefulWidget {
  final List<String> selectedMethods;

  const _MultiSelectDialog({required this.selectedMethods});

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<_MultiSelectDialog> {
  List<String> _availableMethods = ['Cash', 'OVO', 'DANA', 'Debit/Credit Card'];
  List<String> _selectedMethods = [];

  @override
  void initState() {
    super.initState();
    _selectedMethods = List.from(widget.selectedMethods);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
        alignment: Alignment.center,
        child: Text(
          'Select Preferred Payment Methods',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _availableMethods.map((method) {
            return CheckboxListTile(
              title: Text(method),
              value: _selectedMethods.contains(method),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedMethods.add(method);
                  } else {
                    _selectedMethods.remove(method);
                  }
                });
              },
              checkColor: Colors.white,
              activeColor: Colors.amber,
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(foregroundColor: Colors.orange),
        ),
        TextButton(
          child: Text('Apply'),
          onPressed: () {
            Navigator.pop(context, _selectedMethods);
          },
          style: TextButton.styleFrom(foregroundColor: Colors.orange),
        ),
      ],
    );
  }
}
