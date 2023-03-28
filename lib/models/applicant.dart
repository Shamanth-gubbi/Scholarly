import 'package:flutter/material.dart';

class applicant {
  final int stuid;
  final int sponid;
  final int sch_id;
  final String fname;
  final String lname;
  final String staddress;
  final String pincode;
  final int phone;
  final String stupassword;
  final String emailid;
  final String dob;
  final String cur_qual;
  final String basic_qual;
  final String master_qual;
  final String other_qual;
  final String stresume;
  final String photo;

  applicant(
      this.stuid,
      this.sponid,
      this.sch_id,
      this.fname,
      this.lname,
      this.staddress,
      this.pincode,
      this.phone,
      this.stupassword,
      this.emailid,
      this.dob,
      this.cur_qual,
      this.basic_qual,
      this.master_qual,
      this.other_qual,
      this.stresume,
      this.photo);

  factory applicant.fromJson(Map<String, dynamic> json) {
    return applicant(
      json['stuid'],
      json['sponid'],
      json['sch_id'],
      json['fname'],
      json['lname'],
      json['staddress'],
      json['pincode'],
      json['phone'],
      json['stupassword'],
      json['emailid'],
      json['dob'],
      json['cur_qual'],
      json['basic_qual'],
      json['master_qual'],
      json['other_qual'],
      json['stresume'],
      json['photo'],
    );
  }
}
