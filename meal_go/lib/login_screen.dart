import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_go/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meal_go/sign_in_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  var _passwordVisible = false;

  void login() async {
    if (_formkey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? password = prefs.getString(_email.text);

      if (password != null && password == _password.text) {
        if (mounted) {
          ScaffoldMessenger.of(context).clearSnackBars();
          Navigator.pushNamed(context, '/backtohomepage');
        }
      } else {
        if (mounted) {
          showInvalidLoginSnackBar();
        }
      }
    }
  }

  void showInvalidLoginSnackBar() {
    if (ScaffoldMessenger.of(context).mounted) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(const SnackBar(
          content: Text("Invalid Email or Password"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).clearSnackBars();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Log In',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.orange.shade100,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignIn()),
              );
            },
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              color: Colors.orange,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Log In to Go Meal!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Form(
                        key: _formkey,
                        child: Column(children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _emailFocusNode,
                            controller: _email,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "The field is required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(98, 0, 238, 1))),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            obscureText: !_passwordVisible,
                            focusNode: _passwordFocusNode,
                            controller: _password,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "The field is required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.password_outlined),
                                labelText: 'Password',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(98, 0, 238, 1))),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                )),
                          ),
                          const SizedBox(height: 30.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            onPressed: () {
                              login();
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.login, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                        ]))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
