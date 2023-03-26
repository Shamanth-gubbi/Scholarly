import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/login.dart';
import '../models/application.dart';

class ApplicationServices {
  List<application> parseUser(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    var users = list.map((e) => application.fromJson(e)).toList();
    return users;
  }

  Future<List<application>> fetchApplicationbyid(int id) async {
    final http.Response response = await http
        .get(Uri.parse('http://localhost:3000/application/' + id.toString()));

    if (response.statusCode == 200) {
      //print(response.body);
      return compute(parseUser, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<List<application>> fetchApplicationbysponid(int id) async {
    final http.Response response = await http
        .get(Uri.parse('http://localhost:3000/applicants/' + id.toString()));

    if (response.statusCode == 200) {
      //print(response.body);
      return compute(parseUser, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
