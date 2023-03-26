import 'package:flutter/material.dart';
import '../screens/scholarchipList.dart';
import '../screens/scholarchipDetail.dart';
import '../screens/studentProfile.dart';
import '../screens/decision.dart';
import '../screens/appliedScholarshipsList.dart';
import '../screens/studentLogin.dart';
import '../widgets/bottomNavbar.dart';
import '../screens/studentHome.dart';
import '../screens/applicants.dart';
import '../screens/studentEditProfile.dart';
import '../screens/posted.dart';
import '../screens/sponsorHome.dart';
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
      initialRoute: '/sponsorHome',
      routes: {
        '/': (context) => const ScholarshipList(),
        '/scholarshipDetails': (context) => const ScholarshipDetails(),
        '/studentProfile': (context) => const studentProfile(),
        '/Decision': (context) => const Decision(),
        '/AppliedScholarshipsList': (context) =>
            const AppliedScholarshipsList(),
        '/homePage': (context) => const HomePage(),
        '/studentLogin': (context) => StudentLogin(),
        '/applicants': (context) => const ExampleDragAndDrop(),
        '/bottomnavbar': (context) => const MyStatefulWidget(),
        '/studentEditProfile': (context) => const studentEditProfile(),
        '/posted': (context) => const Posted(),
        '/sponsorHome': (context) => const PostedScholarshipsList(),
        '/scholarshipDetails': (context) => const ScholarshipDetails(),
      },
    );
  }
}
