import 'package:flutter/material.dart';
import 'package:scholarlyf/models/login.dart';
import '../models/student.dart';
import '../services/studentServices.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/navigation.dart';
import './studentEditProfile.dart';
import '../services/global.dart';

class studentProfile extends StatefulWidget {
  const studentProfile({Key? key}) : super(key: key);

  @override
  State<studentProfile> createState() => _studentProfileState();
}

class _studentProfileState extends State<studentProfile> {
  StudentServices studentServices = StudentServices();
  late Future<student> futureAlbum;
  late Future<student> futureAlbum1;
  void initState() {
    super.initState();
    //studentId--;
    int id = studentId;

    futureAlbum = studentServices.fetchs(1);
    futureAlbum1 = studentServices.fetchs(id);
  }

  //User user = User('AlienX', 'alien@gmail.com');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),
      body: Center(
        child: FutureBuilder<student>(
          future: futureAlbum1,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Text("First Name:  " + snapshot.data!.fname),
                    Text("Last Name:   " + snapshot.data!.lname),
                    Text("Email id:   " + snapshot.data!.emailid),
                    Text("date of birth:   " + snapshot.data!.dob),
                    Text("address   " + snapshot.data!.staddress),
                    Text("pincode   " + snapshot.data!.pincode),
                    Text("phone number   " + snapshot.data!.phone.toString()),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const studentEditProfile()));
        },
        child: const Icon(Icons.edit),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
