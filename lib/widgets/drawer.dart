// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  final String _url =
      'https://bestprofilepictures.com/wp-content/uploads/2021/04/Cute-Anime-Boy-Profile-Picture.jpg';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                currentAccountPictureSize: Size.square(80.0),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(_url),
                ),
                accountName: Text(
                  "Golam Sarwer",
                  // textScaleFactor: 1.5,
                ),
                accountEmail: Text(
                  "golamsarwer97@gmail.com",
                  // textScaleFactor: 1.2,
                ),
              ),
            ),
            DrawerTile(
              icon: CupertinoIcons.home,
              iconTitle: 'Home',
            ),
            DrawerTile(
              icon: CupertinoIcons.profile_circled,
              iconTitle: 'Profile',
            ),
            DrawerTile(
              icon: CupertinoIcons.mail_solid,
              iconTitle: 'Email',
            ),
          ],
        ),
      ),
    );
  }
}
