import 'package:flutter/material.dart';
import '../screens/applicants.dart';
import '../screens/scholarchipDetail.dart';
import '../services/studentServices.dart';
import '../models/student.dart';

class Posted extends StatefulWidget {
  const Posted({Key? key}) : super(key: key);

  @override
  State<Posted> createState() => _PostedState();
}

class _PostedState extends State<Posted> {
  StudentServices studentServices = StudentServices();
  late Future<List<student>> futureAlbum;
  void initState() {
    super.initState();
    futureAlbum = studentServices.fetchScholarship();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posted'),
      ),
      body: Center(
        // margin: const EdgeInsets.only(top: 40),
        child: FutureBuilder<List<student>>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].fname),
                      subtitle: Text(snapshot.data![index].lname),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ScholarshipDetails()),
                      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ScholarshipDetails()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
