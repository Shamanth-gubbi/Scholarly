import 'package:flutter/material.dart';
import 'package:scholarlyf/models/student.dart';
import 'package:scholarlyf/screens/studentLogin.dart';
import 'package:scholarlyf/services/studentServices.dart';
import 'package:scholarlyf/services/global.dart' as global;
import '../screens/studentHome.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Future<student>? _futureAlbum;
  StudentServices studentServices = StudentServices();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();
  final TextEditingController _controller8 = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();
  final TextEditingController _controller10 = TextEditingController();
  final TextEditingController _controller11 = TextEditingController();
  final TextEditingController _controller12 = TextEditingController();
  final TextEditingController _controller13 = TextEditingController();
  final TextEditingController _controller14 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scholarly'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: (_futureAlbum == null)
              ? SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: _controller1,
                        decoration:
                            const InputDecoration(hintText: 'Enter fname'),
                      ),
                      TextField(
                        controller: _controller2,
                        decoration:
                            const InputDecoration(hintText: 'Enter lname'),
                      ),
                      TextField(
                        controller: _controller3,
                        decoration:
                            const InputDecoration(hintText: 'Enter staddress'),
                      ),
                      TextField(
                        controller: _controller4,
                        decoration:
                            const InputDecoration(hintText: 'Enter pincode'),
                      ),
                      TextField(
                        controller: _controller5,
                        decoration:
                            const InputDecoration(hintText: 'Enter phone'),
                      ),
                      TextField(
                        controller: _controller6,
                        decoration: const InputDecoration(
                            hintText: 'Enter stupassword'),
                      ),
                      TextField(
                        controller: _controller7,
                        decoration:
                            const InputDecoration(hintText: 'Enter emailid'),
                      ),
                      TextField(
                        controller: _controller8,
                        decoration:
                            const InputDecoration(hintText: 'Enter dob'),
                      ),
                      TextField(
                        controller: _controller9,
                        decoration:
                            const InputDecoration(hintText: 'Enter cur_qual'),
                      ),
                      TextField(
                        controller: _controller10,
                        decoration:
                            const InputDecoration(hintText: 'Enter basic_qual'),
                      ),
                      TextField(
                        controller: _controller11,
                        decoration: const InputDecoration(
                            hintText: 'Enter master_qual'),
                      ),
                      TextField(
                        controller: _controller12,
                        decoration:
                            const InputDecoration(hintText: 'Enter other_qual'),
                      ),
                      TextField(
                        controller: _controller13,
                        decoration:
                            const InputDecoration(hintText: 'Enter stresume'),
                      ),
                      TextField(
                        controller: _controller14,
                        decoration:
                            const InputDecoration(hintText: 'Enter photo'),
                      ),
                      ElevatedButton(
                        child: const Text('Sign Up'),
                        onPressed: () {
                          setState(() {
                            _futureAlbum = studentServices.createStudent(
                              _controller1.text,
                              _controller2.text,
                              _controller3.text,
                              _controller4.text,
                              int.parse(_controller5.text),
                              _controller6.text,
                              _controller7.text,
                              _controller8.text,
                              _controller9.text,
                              _controller10.text,
                              _controller11.text,
                              _controller12.text,
                              _controller13.text,
                              _controller14.text,
                            );
                            if (_futureAlbum != null) {
                              global.isLoggedInStudent = true;

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const StudentLogin()));
                            }
                            //global.isLoggedInStudent = true;
                          });
                        },
                      ),
                    ],
                  ),
                )
              : buildFutureBuilder(),
        ),
      ),
    );
  }

  FutureBuilder<student> buildFutureBuilder() {
    return FutureBuilder<student>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.stuid.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
