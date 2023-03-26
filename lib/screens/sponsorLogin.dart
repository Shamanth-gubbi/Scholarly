import 'package:flutter/material.dart';

class SponsorLogin extends StatefulWidget {
  const SponsorLogin({Key? key}) : super(key: key);

  @override
  State<SponsorLogin> createState() => _SponsorLoginState();
}

class _SponsorLoginState extends State<SponsorLogin> {
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
