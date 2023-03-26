import 'package:flutter/material.dart';

class AddScholarship extends StatefulWidget {
  const AddScholarship({Key? key}) : super(key: key);

  @override
  State<AddScholarship> createState() => _AddScholarshipState();
}

class _AddScholarshipState extends State<AddScholarship> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scholarly'),
        ),
        body: Center(
          child: Text('Add Scholarship'),
        ));
  }
}
