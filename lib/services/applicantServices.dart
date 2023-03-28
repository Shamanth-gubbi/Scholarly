import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:scholarlyf/models/applicant.dart';
import '../models/login.dart';
import '../models/application.dart';

class Applicant {
  List<applicant> parseUser(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    var users = list.map((e) => applicant.fromJson(e)).toList();
    return users;
  }

  Future<List<applicant>> fetchApplicants(
    //int stuid,
    int sch_id,
    int sponid,
  ) async {
    final http.Response response = await http.post(
      Uri.parse('http://localhost:3000/applicants'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"sch_id": sch_id, "sponid": sponid}),
    );

    // Dispatch action depending upon
    // the server response
    if (response.statusCode == 200) {
      //print(response.body);
      return compute(parseUser, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
