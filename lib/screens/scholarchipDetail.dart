import 'package:flutter/material.dart';
import '../services/sideNavbar.dart';

class ScholarshipDetails extends StatefulWidget {
  const ScholarshipDetails({Key? key}) : super(key: key);

  @override
  State<ScholarshipDetails> createState() => _ScholarshipDetailsState();
}

class _ScholarshipDetailsState extends State<ScholarshipDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: SideNavBar(title: 'Scholarship Details'),
      appBar: AppBar(
        title: const Text('Scholarship Details'),
      ),
      body: Container(
        child: const Center(
          child: Text('Scholarship Details'),
        ),
      ),
    );
  }
}
