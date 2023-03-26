import 'package:flutter/material.dart';
import '../models/student.dart';

class UserTile extends StatelessWidget {
  final student user;

  UserTile({required this.user});

  // String userTitle() {
  //   String title = "";
  //   if (user.gender == "Male") {
  //     title = "Mr.";
  //   } else if (user.gender == "Female") {
  //     title = "Ms.";
  //   }
  //   return title;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: user.stuid,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.photo),
              ),
            ),
            title: Text(' ${user.fname} ${user.lname}'),
            subtitle: Text(user.emailid),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => UserDetailsPage(user: user)));
            },
          ),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
