import 'package:flutter/material.dart';

class sponsor {
  final int sponid;
  final String fname;
  final String lname;
  final String typeIS;
  final String profession;
  final String spaddress;
  final String pincode;
  final int phone;
  final String sppassword;
  final String emailid;

  sponsor(this.sponid, this.fname, this.lname, this.typeIS, this.profession,
      this.spaddress, this.pincode, this.phone, this.sppassword, this.emailid);

  factory sponsor.fromJson(Map<String, dynamic> json) {
    return sponsor(
      json['sponid'],
      json['fname'],
      json['lname'],
      json['typeIS'],
      json['profession'],
      json['spaddress'],
      json['pincode'],
      json['phone'],
      json['sppassword'],
      json['emailid'],
    );
  }
}
