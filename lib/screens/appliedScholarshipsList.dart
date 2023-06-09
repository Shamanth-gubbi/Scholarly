import 'package:flutter/material.dart';
import '../models/application.dart';
import '../services/applicationServices.dart';
import '../services/global.dart' as global;
import './scholarchipDetail.dart';

class AppliedScholarshipsList extends StatefulWidget {
  const AppliedScholarshipsList({Key? key}) : super(key: key);

  @override
  State<AppliedScholarshipsList> createState() =>
      _AppliedScholarshipsListState();
}

class _AppliedScholarshipsListState extends State<AppliedScholarshipsList> {
  ApplicationServices applicationServices = ApplicationServices();
  late Future<List<application>> futureApplications;

  void initState() {
    super.initState();
    futureApplications =
        applicationServices.fetchApplicationbyid(global.studentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Applied Scholarships List'),
      // ),
      body: Center(
        // margin: const EdgeInsets.only(top: 40),
        child: FutureBuilder<List<application>>(
          future: futureApplications,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].title),
                      subtitle: Text(snapshot.data![index].shdescription),
                      onTap: () {
                        setState(() {
                          global.scholarshipId = snapshot.data![index].sch_id;
                        });
                        print(global.scholarshipId);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ScholarshipDetails()),
                        );
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
