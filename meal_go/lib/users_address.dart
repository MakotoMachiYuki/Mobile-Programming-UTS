import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Address'),
          centerTitle: true,
          backgroundColor: Colors.orange,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [Container(), Container()],
        ));
  }
}
