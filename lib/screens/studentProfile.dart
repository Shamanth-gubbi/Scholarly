import 'package:flutter/material.dart';
import 'package:scholarlyf/models/login.dart';
import '../models/student.dart';
import '../services/studentServices.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class studentProfile extends StatefulWidget {
  const studentProfile({Key? key}) : super(key: key);

  @override
  State<studentProfile> createState() => _studentProfileState();
}

class _studentProfileState extends State<studentProfile> {
  StudentServices studentServices = StudentServices();
  late Future<student> futureAlbum;
  void initState() {
    super.initState();
    futureAlbum = studentServices.fetchs();
  }

  //User user = User('AlienX', 'alien@gmail.com');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),
      body: FutureBuilder<student>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text(snapshot.data!.emailid),
                  Text(snapshot.data!.lname),
                  Text(snapshot.data!.fname),
                  Text(snapshot.data!.dob),
                  Text(snapshot.data!.staddress),
                  Text(snapshot.data!.pincode),
                  Text(snapshot.data!.phone.toString()),
                  Text(snapshot.data!.stresume),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
