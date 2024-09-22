import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.orange),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(),
                  Container(),
                  IconButton(
                      onPressed: null,
                      icon: Icon(CupertinoIcons.pencil_ellipsis_rectangle))
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(),
                  Container(),
                ],
              ),
            )
          ],
        ));
  }
}
