import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './appliedScholarshipsList.dart';
import './scholarchipList.dart';
import './studentProfile.dart';

const double windowWidth = 1024;
const double windowHeight = 800;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.light(useMaterial3: true),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  //icon: Icon(Icons.flash_on),
                  text: 'Applied ',
                ),
                Tab(
                  //icon: Icon(Icons.sync),
                  text: 'Explore ',
                ),
                Tab(
                  //icon: Icon(Icons.storage),
                  text: 'Profile',
                ),
              ],
            ),
            title: const Text('Scholarly'),
          ),
          body: const TabBarView(
            children: [
              AppliedScholarshipsList(),
              ScholarshipList(),
              studentProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
