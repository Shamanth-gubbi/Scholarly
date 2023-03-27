import 'package:flutter/material.dart';
import 'package:scholarlyf/models/student.dart';
//import 'HomePage.dart';
import '../services/studentServices.dart';
import '../models/login.dart';
import '../services/global.dart' as global;
import '../models/student.dart';
import 'dart:async';
import 'dart:convert';
import '../services/studentServices.dart';
import '../services/navigation.dart';
import '../screens/studentHome.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  StudentServices studentServices = StudentServices();

  Future<student>? futureAlbum1;
  void initState() {
    super.initState();

    //futureAlbum1 = studentServices.fetchs(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scholarly'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (futureAlbum1 == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  FutureBuilder<student> buildFutureBuilder() {
    return FutureBuilder<student>(
      future: futureAlbum1,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
          global.studentId = snapshot.data!.stuid;
          return Text(snapshot.data!.lname);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            onChanged: (value) {
              setState(() {
                global.studentEmail = _controller.text;
                print(global.studentEmail);
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _controller1,
            decoration: const InputDecoration(
              hintText: 'Enter your password',
            ),
            onChanged: (value) {
              setState(() {
                global.studentPassword = _controller1.text;
                print(global.studentPassword);
              });
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
              futureAlbum1 = studentServices.LoginStudent(
                  global.studentEmail, global.studentPassword);
            });
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
