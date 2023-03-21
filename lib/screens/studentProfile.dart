import 'package:flutter/material.dart';

class studentProfile extends StatefulWidget {
  const studentProfile({Key? key}) : super(key: key);

  @override
  State<studentProfile> createState() => _studentProfileState();
}

class _studentProfileState extends State<studentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),
      body: const Center(
        child: Text('Student Profile'),
      ),
    );
  }
}
