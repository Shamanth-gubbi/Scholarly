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
    String emailid = studentEmail;

    // int id = 2;
    //futureAlbum = studentServices.fetchs(1);
    futureAlbum1 = studentServices.fetchs(emailid);
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
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(20),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    SizedBox(
                      // height: 80,
                      // width: 200,
                      child: Column(children: [
                        const Icon(Icons.person, size: 100),
                        //Image.asset('assets/images/Student.png'),
                        Text("First Name:  " + snapshot.data!.fname,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                        Text("Last Name:   " + snapshot.data!.lname,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                        Text("Email id:   " + snapshot.data!.emailid,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                        Text("date of birth:   " + snapshot.data!.dob,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                        Text("address   " + snapshot.data!.staddress,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                        Text("pincode   " + snapshot.data!.pincode,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                        Text(
                            "phone number   " + snapshot.data!.phone.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                        Text(snapshot.data!.stresume,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                      ]),
                    ),
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
