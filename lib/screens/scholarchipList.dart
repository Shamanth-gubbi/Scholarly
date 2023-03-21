import 'package:flutter/material.dart';
import './scholarchipDetail.dart';

class ScholarshipList extends StatefulWidget {
  const ScholarshipList({Key? key}) : super(key: key);

  @override
  State<ScholarshipList> createState() => _ScholarshipListState();
}

class _ScholarshipListState extends State<ScholarshipList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scholarship List'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 180,
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 50, top: 50),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              //cryptoIcon(),
                              Text("data"),
                              SizedBox(
                                height: 10,
                              ),
                              Text("data"),
                              Spacer(),
                              Text("data"),
                              SizedBox(
                                width: 10,
                              ),
                              Text("data"),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: Row(
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ScholarshipDetails())),
                                  child: const Text('Details'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
