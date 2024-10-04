import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _newPasswordFocusNode = FocusNode();
  final FocusNode _confirmNewPasswordFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  bool _newPasswordVisible = false;
  bool _confirmNewPasswordVisible = false;

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _usernameFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmNewPasswordFocusNode.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  final emailValidator =
      ValidationBuilder().email('Input a valid email address').build();
  final usernameValidator = ValidationBuilder()
      .minLength(8, 'Your username must be at least 8 characters')
      .maxLength(25, 'Your username must not exceed 25 characters')
      .regExp(RegExp(r'^[a-zA-Z0-9_]+$'),
          'Your username can only contain letters, numbers and "_"')
      .build();
  final passwordValidator = ValidationBuilder()
      .minLength(8, 'Password must be at least 8 characters')
      .regExp(RegExp(r'(?=.*[0-9])'),
          'Your password must contain minimum one number')
      .regExp(RegExp(r'(?=.*[a-z])'),
          'Your password must contain minimum one lowercase')
      .regExp(RegExp(r'(?=.*[A-Z])'),
          'Your password must contain minimum one uppercase')
      .regExp(RegExp(r'(?=.*[*\W])'),
          'Your password must contain minimum one special character')
      .build();

  void _changePassword() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = _emailController.text;
      String newPassword = _newPasswordController.text;

      await prefs.setString(email, newPassword);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Password Reset Successful',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reset Password',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 44,
        backgroundColor: Colors.orange.shade100,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'By changing your password, your old password will no longer be valid to access your account.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  validator: emailValidator,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Enter your email address',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_usernameFocusNode),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                  validator: usernameValidator,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    labelText: 'Enter your username',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context)
                      .requestFocus(_newPasswordFocusNode),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _newPasswordController,
                  focusNode: _newPasswordFocusNode,
                  obscureText: !_newPasswordVisible,
                  validator: passwordValidator,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Enter new password',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _newPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _newPasswordVisible = !_newPasswordVisible;
                        });
                      },
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context)
                      .requestFocus(_confirmNewPasswordFocusNode),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmNewPasswordController,
                  focusNode: _confirmNewPasswordFocusNode,
                  obscureText: !_confirmNewPasswordVisible,
                  validator: (val) {
                    if (val!.isEmpty) return "Please confirm your new password";
                    if (val != _newPasswordController.text)
                      return "Passwords don't match";
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_reset),
                    labelText: 'Confirm password',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _confirmNewPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _confirmNewPasswordVisible =
                              !_confirmNewPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  onPressed: _changePassword,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Resst Password',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
