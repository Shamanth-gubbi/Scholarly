import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/login.dart';
import '../models/scholarship.dart';

class ScholarshipServices {
  List<scholarship> parseUser(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    var users = list.map((e) => scholarship.fromJson(e)).toList();
    return users;
  }

  Future<List<scholarship>> fetchScholarship() async {
    final http.Response response =
        await http.get(Uri.parse('http://localhost:3000/scholarship'));

    if (response.statusCode == 200) {
      //print(response.body);
      return compute(parseUser, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<scholarship>> fetchScholarshipbyid(int id) async {
    final http.Response response = await http
        .get(Uri.parse('http://localhost:3000/scholarship/' + id.toString()));

    if (response.statusCode == 200) {
      //print(response.body);
      return compute(parseUser, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
