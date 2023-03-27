import 'package:flutter/material.dart';
import 'package:scholarlyf/models/sponsor.dart';
import 'package:scholarlyf/models/student.dart';
import 'package:scholarlyf/screens/sponsorHome.dart';
//import 'HomePage.dart';
import '../services/studentServices.dart';
import '../models/login.dart';
import '../services/global.dart' as global;
import '../models/student.dart';
import 'dart:async';
import 'dart:convert';
import '../services/sponsorServices.dart';
import '../services/navigation.dart';
import '../screens/studentHome.dart';

class SponsorLogin extends StatefulWidget {
  const SponsorLogin({Key? key}) : super(key: key);

  @override
  State<SponsorLogin> createState() => _SponsorLoginState();
}

class _SponsorLoginState extends State<SponsorLogin> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();

  SponsorServices studentServices = SponsorServices();
  Future<sponsor>? futureAlbum1;
  void initState() {
    super.initState();

    //futureAlbum1 = studentServices.fetchs(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sponsor Login'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (futureAlbum1 == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  FutureBuilder<sponsor> buildFutureBuilder() {
    return FutureBuilder<sponsor>(
      future: futureAlbum1,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PostedScholarshipsList()));
          global.studentId = snapshot.data!.sponid;
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
                global.sponsorEmail = _controller.text;
                print(global.sponsorEmail);
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
                global.sponsorPassword = _controller1.text;
                print(global.sponsorPassword);
              });
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              futureAlbum1 = studentServices.LoginSponsor(
                  global.studentEmail, global.studentPassword);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PostedScholarshipsList()));
            });
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
