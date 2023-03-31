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
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 80),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data![index].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blue,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //color: Colors.blue[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Description:        " +
                                      snapshot.data![index].shdescription),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //color: Colors.blue[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Eligibility:                     " +
                                      snapshot.data![index].eligibility),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //color: Colors.blue[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Amount:        " +
                                      snapshot.data![index].shamount
                                          .toString()),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //color: Colors.blue[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Apply by:        " +
                                      snapshot.data![index].deadline),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //color: Colors.blue[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("number of scholarships:        " +
                                      snapshot.data![index].no_of_scholarships
                                          .toString()),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //color: Colors.blue[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("related links:        " +
                                      snapshot.data![index].related_link),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //color: Colors.blue[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("posted date:        " +
                                      snapshot.data![index].postdate),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //color: Colors.blue[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Other supports:        " +
                                      snapshot.data![index].other_support),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //color: Colors.blue[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Reserved for women:        " +
                                      snapshot.data![index].NSRG.toString()),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //color: Colors.blue[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Category:   " +
                                      snapshot.data![index].category),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(
                                      onPressed: () {},
                                      child: Icon(Icons.chat),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FloatingActionButton(
                                      onPressed: () {},
                                      child: Icon(Icons.link),
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {},
                                    child: Icon(Icons.favorite),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                                shadowColor: Colors.grey,
                                elevation: 5,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 170, vertical: 20),
                              ),
                              onPressed: () {},
                              child: Text("Apply"))
                        ]),
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
