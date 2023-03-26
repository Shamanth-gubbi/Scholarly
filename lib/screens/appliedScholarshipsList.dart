import 'package:flutter/material.dart';

class AppliedScholarshipsList extends StatefulWidget {
  const AppliedScholarshipsList({Key? key}) : super(key: key);

  @override
  State<AppliedScholarshipsList> createState() =>
      _AppliedScholarshipsListState();
}

class _AppliedScholarshipsListState extends State<AppliedScholarshipsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Applied Scholarships List'),
      // ),
      body: Center(
        child: ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/Decision');
          },
          child: const Text('Decision'),
        ),
      ),
    );
  }
}
