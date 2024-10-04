import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
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
      print('Error loading shared preferences: $e');
      setState(() {
        _prefsLoaded = true;
      });
    }
  }

  Future<void> _savePolicyStatus(bool status) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('privacy_policy_accepted', status);
      setState(() {
        _policyAccepted = status;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(status ? 'Go Meal Privacy Policy accepted' : 'Go Meal Privacy Policy denied')),
      );
    } catch (e) {
      print('Error saving shared preferences: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preference Set Error. Please Try Again')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.all(10),
          onPressed: () => Navigator.pop(context, _policyAccepted),
          iconSize: 15,
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Go Meal Privacy Policy',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 44,
        backgroundColor: Colors.orange.shade100,
      ),
      body: _prefsLoaded
          ? SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  //*PRIVACY POLICY TEXT BERSIFAT DUMMY DAN DIGENERATE OLEH CHATGPT*/
                  Text(
                    '''
At goMeal, we are committed to protecting your privacy and ensuring your personal data is handled responsibly. This Privacy Policy explains how we collect, use, and share your information when you use our app and services.

1. Information We Collect
We collect the following types of information:
Personal Information: Name, email address, phone number, delivery address, and payment information when you sign up or make an order.
Usage Data: Information on how you interact with the app, such as pages visited, items viewed, and orders placed.
Location Data: With your permission, we may collect your precise location to provide better service (e.g., more accurate delivery).

2. How We Use Your Information
We use your information to:
Process your orders and payments.
Provide customer support.
Improve our app and services.
Send you notifications about your order status.
Offer personalized recommendations.
Ensure the security of your data and prevent fraud.

3. Sharing of Information
We may share your personal data with:

Delivery Partners: To fulfill your orders, we share relevant details like your name, address, and contact number with delivery personnel.
Payment Providers: To process payments, we share necessary financial details with trusted payment processors.
Third-Party Services: For analytics, marketing, and customer service, we may share data with third-party service providers.
We do not sell your personal information to third parties.

4. Data Security
We take data security seriously and implement appropriate technical and organizational measures to protect your data. However, no system can be 100% secure, and we cannot guarantee absolute security of your information.

5. Your Rights
You have the right to:
Access your personal data and request corrections.
Delete your account and associated personal data.
Withdraw your consent for the use of location data at any time.
Opt out of promotional communications.

6. Cookies and Tracking Technologies
We use cookies to enhance your experience on goMeal. Cookies help us understand user preferences and improve our app functionality.

7. Changes to This Policy
We may update this Privacy Policy from time to time. If changes are made, we will notify you through the app or via email. Your continued use of goMeal constitutes acceptance of these changes.
                    ''',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _savePolicyStatus(true),
                        child: Text('I Accept'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _savePolicyStatus(false),
                        child: Text('I Deny'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
