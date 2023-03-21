import 'package:flutter/material.dart';
import '../screens/scholarchipList.dart';
import '../screens/scholarchipDetail.dart';
import '../screens/studentProfile.dart';
import '../screens/decision.dart';
import '../screens/appliedScholarshipsList.dart';
import './sideNavbar.dart';
// class MyNavigator extends StatefulWidget {
//   const MyNavigator({Key? key}) : super(key: key);

//   @override
//   State<Navigator> createState() => _NavigatorState();
// }

// class _NavigatorState extends State<Navigator> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Named Routes Demo',
//       // Start the app with the "/" named route. In this case, the app starts
//       // on the FirstScreen widget.
//       initialRoute: '/',
//       routes: {
//         // When navigating to the "/" route, build the FirstScreen widget.
//         '/': (context) => const ScholarshipList(),
//         // When navigating to the "/second" route, build the SecondScreen widget.
//         '/second': (context) => const ScholarshipDetails(),
//       },
//     );
//   }
// }

class MyNavigator extends StatelessWidget {
  const MyNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const ScholarshipList(),
        '/scholarshipDetails': (context) => const ScholarshipDetails(),
        '/studentProfile': (context) => const studentProfile(),
        '/Decision': (context) => const Decision(),
        '/AppliedScholarshipsList': (context) =>
            const AppliedScholarshipsList(),
        '/scholarshipDetails': (context) => const ScholarshipDetails(),
        '/scholarshipDetails': (context) => const ScholarshipDetails(),
        '/scholarshipDetails': (context) => const ScholarshipDetails(),
        '/scholarshipDetails': (context) => const ScholarshipDetails(),
        '/scholarshipDetails': (context) => const ScholarshipDetails(),
        '/scholarshipDetails': (context) => const ScholarshipDetails(),
        '/scholarshipDetails': (context) => const ScholarshipDetails(),
        '/scholarshipDetails': (context) => const ScholarshipDetails(),
      },
    );
  }
}
