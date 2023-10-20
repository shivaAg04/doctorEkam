import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internship/model/doctor_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:internship/model/select_package_model.dart';

class Api {
  static List<DoctorDetailsModel> doctorList = [];
  static List<String> duration = [];
  static List<String> package = [];

  //fetching doctor details from api
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

  //select package api
  static Future<void> getSelectPackage() async {
    final resposne = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointment_options'));
    var data = jsonDecode(resposne.body.toString());
    print(data);
    print(duration.length);
    print(resposne.statusCode);
    if (resposne.statusCode == 200) {
      duration.clear();
      package.clear();
      data['duration'].forEach((v) {
        duration.add(v);
      });
      data['package'].forEach((v) {
        package.add(v);
      });
      print("Duration: ${duration.length}");
      print(duration[0]);
    }
  }
}
