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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.orange,
              height: 100,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Nama'),
                          Text('youremail@mail.com'),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: null,
                    iconSize: 30,
                    icon: Icon(
                      CupertinoIcons.pencil_ellipsis_rectangle,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Row(
                        children: [Icon(CupertinoIcons.paperclip)],
                      )
                    ],
                  ),
                  Container(),
                ],
              ),
            )
          ],
        ));
  }
}
