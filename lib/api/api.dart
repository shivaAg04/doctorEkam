import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internship/model/doctor_details_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static List<DoctorDetailsModel> doctorList = [];
  static Future<List<DoctorDetailsModel>> getDoctorDetails() async {
    final resposne = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/githubforekam/doctor-appointment/doctors'));
    var data = jsonDecode(resposne.body.toString());
    if (resposne.statusCode == 200) {
      doctorList.clear();
      for (Map i in data) {
        i as Map<String, dynamic>;
        doctorList.add(DoctorDetailsModel.fromJson(i));
      }
      return doctorList;
    } else {
      return doctorList;
    }
  }
}
