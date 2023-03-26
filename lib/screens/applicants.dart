import 'package:flutter/material.dart';
import '../models/application.dart';
import '../services/applicationServices.dart';
import '../services/global.dart' as global;
import './scholarchipDetail.dart';

class ApplicantsList extends StatefulWidget {
  const ApplicantsList({Key? key}) : super(key: key);

  @override
  State<ApplicantsList> createState() => _ApplicantsListState();
}

class _ApplicantsListState extends State<ApplicantsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scholarly'),
        ),
        body: Center(
          child: Text('Applicants List'),
        ));
  }
}
