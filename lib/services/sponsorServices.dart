import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login.dart';
import '../models/sponsor.dart';
import 'package:flutter/foundation.dart';

class SponsorServices {
  static const API = 'http://localhost:3000/';
  static const headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  // Future<User> login(user) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(API + 'students/login'),
  //       headers: headers,
  //       body: json.encode(user.toJson()),
  //     );
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       return User.fromJson(json.decode(response.body));
  //     } else {
  //       throw Exception('Failed to load data!');
  //     }
  //   } on SocketException {
  //     throw Exception('No Internet connection');
  //   }
  // }

  List<sponsor> parseUser(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    var users = list.map((e) => sponsor.fromJson(e)).toList();
    return users;
  }

  Future<List<sponsor>> fetchScholarship() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/students/'));

    if (response.statusCode == 200) {
      return compute(parseUser, response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<sponsor> LoginSponsor(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/sponsors/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'emailid': email,
        'sppassword': password,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      //print(response.body);

      return sponsor.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Future<sponsor> fetchs(String emailid) async {
    //String url = API + 'students/' + id.toString();
    final response =
        await http.get(Uri.parse('http://localhost:3000/students/' + emailid));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //print((response.body));
      return sponsor.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<sponsor> createSponsor(
    //final int sponid;
    String fname,
    String lname,
    String typeIS,
    String profession,
    String spaddress,
    String pincode,
    int phone,
    String sppassword,
    String emailid,
  ) async {
    final http.Response response = await http.post(
      Uri.parse('http://localhost:3000/sponsors/createSponsor'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "fname": fname,
        "lname": lname,
        "typeIS": typeIS,
        "profession": profession,
        "spaddress": spaddress,
        "pincode": pincode,
        "emailid": emailid,
        "phone": phone,
        "sppassword": sppassword,
        "emailid": emailid,
      }),
    );

    // Dispatch action depending upon
    // the server response
    if (response.statusCode == 201) {
      print(response.body);
      return sponsor.fromJson(json.decode(response.body));
    } else {
      throw Exception('Album loading failed!');
    }
  }

//temp
// Column buildColumn() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         TextField(
//           controller: _controller,
//           decoration:
//               const InputDecoration(hintText: 'Enter Title'),
//         ),
//         ElevatedButton(
//           child: const Text('Create Data'),
//           onPressed: () {
//             setState(() {
//               _futureAlbum = createAlbum(_controller.text);
//             });
//           },
//         ),
//       ],
//     );
//   }

//   FutureBuilder<student>(
//     future: _futureAlbum,
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         return Text(snapshot.data!.title);
//       } else if (snapshot.hasError) {
//         return Text("${snapshot.error}");
//       }

//       return const CircularProgressIndicator();
//     },
//   ),

  //temp
  Future<List<sponsor>> getStudents() async {
    try {
      final response = await http.get(Uri.parse(API + 'students'));
      if (response.statusCode == 200) {
        List<sponsor> list = json.decode(response.body);
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
