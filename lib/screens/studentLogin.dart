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
  student? stud;
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
          global.studentId = snapshot.data!.stuid;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
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
        //Image.asset('../assets/logo.jpg'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              fillColor: Colors.red,
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
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
            shadowColor: Colors.grey,
            elevation: 5,
            padding: const EdgeInsets.symmetric(horizontal: 170, vertical: 20),
          ),
          onPressed: () {
            setState(() async {
              stud = await studentServices.LoginStudent(
                  global.studentEmail, global.studentPassword);
              // futureAlbum1 = studentServices.LoginStudent(
              //     global.studentEmail, global.studentPassword);
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => const HomePage()));

              if (stud!.stuid == null) {
                print("Invalid Credentials");
              } else {
                global.studentId = stud!.stuid;
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
                print("Valid Credentials");
              }
            });
            // if (stud == null) {
            //   print("Invalid Credentials");
            // } else {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => const HomePage()));
            //   print("Valid Credentials");
            // }
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
