import 'package:flutter/material.dart';

class application {
  final int sch_id;
  final String title;
  final String shdescription;
  final int no_of_scholarships;
  final int shamount;
  final String deadline;
  final String eligibility;
  final String postdate;
  final String other_support;
  final String related_link;
  final int NSRG;
  final String category;
  application(
      this.sch_id,
      this.title,
      this.shdescription,
      this.no_of_scholarships,
      this.shamount,
      this.deadline,
      this.eligibility,
      this.postdate,
      this.other_support,
      this.related_link,
      this.NSRG,
      this.category);

  factory application.fromJson(Map<String, dynamic> json) {
    return application(
      json['sch_id'],
      json['title'],
      json['shdescription'],
      json['no_of_scholarships'],
      json['shamount'],
      json['deadline'],
      json['eligibility'],
      json['postdate'],
      json['other_support'],
      json['related_link'],
      json['NSRG'],
      json['category'],
    );
  }
}
