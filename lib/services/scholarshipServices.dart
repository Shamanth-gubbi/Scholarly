import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/login.dart';
import '../models/student.dart';

class ScholarshipServices {
  List<User> parseUser(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    var users = list.map((e) => User.fromJson(e)).toList();
    return users;
  }

  Future<List<student>> fetchScholarship() async {
    final http.Response response =
        await http.get(Uri.parse('http://localhost:3000/scholarship'));

    if (response.statusCode == 200) {
      return compute(parseUser, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<student> fetchall() async {
    //String url = API + 'students/' + id.toString();
    final response =
        await http.get(Uri.parse('http://localhost:3000/scholarship'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print((response.body));
      return student.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
