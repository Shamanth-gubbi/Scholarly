import 'package:flutter/material.dart';
import 'package:scholarlyf/models/sponsor.dart';
import 'package:scholarlyf/models/student.dart';
import 'package:scholarlyf/screens/sponsorLogin.dart';
import 'package:scholarlyf/screens/studentLogin.dart';
import 'package:scholarlyf/services/sponsorServices.dart';
import 'package:scholarlyf/services/global.dart' as global;
import '../screens/studentHome.dart';

class SponsorSignupPage extends StatefulWidget {
  const SponsorSignupPage({Key? key}) : super(key: key);

  @override
  State<SponsorSignupPage> createState() => _SponsorSignupPageState();
}

class _SponsorSignupPageState extends State<SponsorSignupPage> {
  Future<sponsor>? _futureAlbum;
  SponsorServices sponsorServices = SponsorServices();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();
  final TextEditingController _controller8 = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();

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
                            const InputDecoration(hintText: 'Enter typeIS'),
                      ),
                      TextField(
                        controller: _controller4,
                        decoration:
                            const InputDecoration(hintText: 'Enter profession'),
                      ),
                      TextField(
                        controller: _controller5,
                        decoration:
                            const InputDecoration(hintText: 'Enter spaddress'),
                      ),
                      TextField(
                        controller: _controller6,
                        decoration:
                            const InputDecoration(hintText: 'Enter pincode'),
                      ),
                      TextField(
                        controller: _controller7,
                        decoration:
                            const InputDecoration(hintText: 'Enter phone'),
                      ),
                      TextField(
                        controller: _controller8,
                        decoration:
                            const InputDecoration(hintText: 'Enter sppassword'),
                      ),
                      TextField(
                        controller: _controller9,
                        decoration:
                            const InputDecoration(hintText: 'Enter emailid'),
                      ),
                      ElevatedButton(
                        child: const Text('Sign Up'),
                        onPressed: () {
                          setState(() {
                            _futureAlbum = sponsorServices.createSponsor(
                              _controller1.text,
                              _controller2.text,
                              _controller3.text,
                              _controller4.text,
                              _controller5.text,
                              _controller6.text,
                              int.parse(_controller7.text),
                              _controller8.text,
                              _controller9.text,
                            );
                            if (_futureAlbum != null) {
                              global.isLoggedInCompany = true;

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SponsorLogin()));
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

  FutureBuilder<sponsor> buildFutureBuilder() {
    return FutureBuilder<sponsor>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.sponid.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
