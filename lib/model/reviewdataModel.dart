import 'package:flutter/material.dart';

class ReviewDataModel {
  static ReviewDataModel rm = ReviewDataModel(
    doctor_image: '',
    doctor_name: '',
    speciality: '',
    location: '',
    date: '',
    time: '',
    duration: '30 min',
    package: '',
  );
  String doctor_image;
  String doctor_name;
  String speciality;
  String location;
  String date;
  String time;
  String duration;
  String package;

  ReviewDataModel({
    required this.doctor_image,
    required this.doctor_name,
    required this.speciality,
    required this.location,
    required this.date,
    required this.time,
    required this.duration,
    required this.package,
  });
}
