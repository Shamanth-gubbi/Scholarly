import 'package:flutter/material.dart';

class Decision extends StatefulWidget {
  const Decision({Key? key}) : super(key: key);

  @override
  State<Decision> createState() => _DecisionState();
}

class _DecisionState extends State<Decision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decision'),
      ),
      body: const Center(
        child: Text('Decision'),
      ),
    );
  }
}
