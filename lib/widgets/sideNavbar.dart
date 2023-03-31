import 'package:flutter/material.dart';
import 'package:scholarlyf/screens/learn.dart';

import '../screens/messages.dart';
import '../screens/studentEditProfile.dart';
import '../screens/studentProfile.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blue[500],
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('../assets/logo.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const studentProfile()))
            },
          ),
          ListTile(
            leading: Icon(Icons.explore),
            title: Text('Learn'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Learn()))
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Messages'),
            onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Messages()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
