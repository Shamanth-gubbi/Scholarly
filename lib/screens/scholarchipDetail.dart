import 'package:flutter/material.dart';
//import '../services/sideNavbar.dart';
import '../models/scholarship.dart';
import '../services/scholarshipServices.dart';
import '../services/global.dart';

class ScholarshipDetails extends StatefulWidget {
  const ScholarshipDetails({Key? key}) : super(key: key);

  @override
  State<ScholarshipDetails> createState() => _ScholarshipDetailsState();
}

class _ScholarshipDetailsState extends State<ScholarshipDetails> {
  ScholarshipServices scholarshipServices = ScholarshipServices();
  late Future<List<scholarship>> futureScholarship;
  void initState() {
    super.initState();
    int id = scholarshipId;
    //futureScholarship = scholarshipServices.fetchScholarshipbyid(scholarshipId);
    futureScholarship = scholarshipServices.fetchScholarshipbyid(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: SideNavBar(title: 'Scholarship Details'),

      appBar: AppBar(
        title: const Text('Scholarship Details'),
      ),
      body: Center(
        // margin: const EdgeInsets.only(top: 40),
        child: FutureBuilder<List<scholarship>>(
          future: futureScholarship,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Text(snapshot.data![index].title),
                    Text(snapshot.data![index].shdescription),
                    Text(snapshot.data![index].eligibility),
                    Text(snapshot.data![index].shamount.toString()),
                    Text(snapshot.data![index].deadline),
                    Text(snapshot.data![index].no_of_scholarships.toString()),
                    Text(snapshot.data![index].related_link),
                    Text(snapshot.data![index].postdate),
                    Text(snapshot.data![index].other_support),
                    Text(snapshot.data![index].NSRG.toString()),
                    Text(snapshot.data![index].category),
                    ElevatedButton(onPressed: () {}, child: Text("Apply"))
                  ]);
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
