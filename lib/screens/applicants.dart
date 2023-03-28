import 'package:flutter/material.dart';
import 'package:scholarlyf/screens/studentProfile.dart';
import '../models/application.dart';
import '../services/applicantServices.dart';
import '../services/applicationServices.dart';
import '../services/global.dart' as global;
import './scholarchipDetail.dart';
import '../services/studentServices.dart';
import '../models/applicant.dart';

class ApplicantsList extends StatefulWidget {
  const ApplicantsList({Key? key}) : super(key: key);

  @override
  State<ApplicantsList> createState() => _ApplicantsListState();
}

class _ApplicantsListState extends State<ApplicantsList> {
  Applicant application = Applicant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scholarly'),
        ),
        body: FutureBuilder<List<applicant>>(
          future: application.fetchApplicants(
              global.scholarshipId, global.companyId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                              ),
                              onPressed: () {
                                setState(() {
                                  global.studentId =
                                      snapshot.data![index].stuid;
                                  global.studentEmail =
                                      snapshot.data![index].emailid;
                                });
                                print(snapshot.data![index].stuid);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => studentProfile()),
                                );
                              },
                              child: SizedBox(
                                width: 200,
                                child: Column(
                                  children: [
                                    Text(snapshot.data![index].fname),
                                    Text(snapshot.data![index].emailid),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.check),
                            backgroundColor: Colors.green[300],
                          ),
                          FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.close),
                            backgroundColor: Colors.red[300],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
