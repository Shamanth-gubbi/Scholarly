import 'package:flutter/material.dart';
import 'package:scholarlyf/models/scholarship.dart';
import './scholarchipDetail.dart';
import '../services/scholarshipServices.dart';
import '../services/global.dart' as globals;

class ScholarshipList extends StatefulWidget {
  const ScholarshipList({Key? key}) : super(key: key);

  @override
  State<ScholarshipList> createState() => _ScholarshipListState();
}

class _ScholarshipListState extends State<ScholarshipList> {
  ScholarshipServices scholarshipServices = ScholarshipServices();
  late Future<List<scholarship>> futureScholarships;
  void initState() {
    super.initState();
    futureScholarships = scholarshipServices.fetchScholarship();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scholarship List'),
      ),
      body: Center(
        // margin: const EdgeInsets.only(top: 40),
        child: FutureBuilder<List<scholarship>>(
          future: futureScholarships,
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
                            globals.scholarshipId =
                                snapshot.data![index].sch_id;
                          });
                          print(globals.scholarshipId);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ScholarshipDetails()),
                          );
                        }),
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
