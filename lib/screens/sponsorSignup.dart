import 'package:flutter/material.dart';

class sponsorLogin extends StatefulWidget {
  const sponsorLogin({Key? key}) : super(key: key);

  @override
  State<sponsorLogin> createState() => _sponsorLoginState();
}

class _sponsorLoginState extends State<sponsorLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scholarly'),
        ),
        body: Center(
          child: Text('Sponsor Login'),
        ));
  }
}
