import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class studentEditProfile extends StatefulWidget {
  const studentEditProfile({Key? key}) : super(key: key);

  @override
  State<studentEditProfile> createState() => _studentEditProfileState();
}

class _studentEditProfileState extends State<studentEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Container(
        child: const Center(
          child: Text('Edit Profile'),
        ),
      ),
    );
  }
}
