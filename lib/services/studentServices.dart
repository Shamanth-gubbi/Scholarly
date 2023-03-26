import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/login.dart';
import '../models/student.dart';
import 'package:flutter/foundation.dart';

class StudentServices {
  static const API = 'http://localhost:3000/';
  static const headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  Future<User> login(user) async {
    try {
      final response = await http.post(
        Uri.parse(API + 'students/login'),
        headers: headers,
        body: json.encode(user.toJson()),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load data!');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }

  List<student> parseUser(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    var users = list.map((e) => student.fromJson(e)).toList();
    return users;
  }

  Future<List<student>> fetchScholarship() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/students/'));

    if (response.statusCode == 200) {
      return compute(parseUser, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<student> fetchs(int id) async {
    //String url = API + 'students/' + id.toString();
    final response = await http
        .get(Uri.parse('http://localhost:3000/students/' + id.toString()));

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

  Future<List<student>> getStudents() async {
    try {
      final response = await http.get(Uri.parse(API + 'students'));
      if (response.statusCode == 200) {
        List<student> list = json.decode(response.body);
        print(response.body);
        return list;
      } else {
        throw Exception('Failed to load data!');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }
}
