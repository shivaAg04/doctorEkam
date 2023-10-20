import 'package:flutter/material.dart';

class DoctorDetailsModel {
  String? doctorName;
  String? image;
  String? speciality;
  String? location;
  int? patientsServed;
  int? yearsOfExperience;
  double? rating;
  int? numberOfReviews;
  // Availability? availability;

  DoctorDetailsModel({
    this.doctorName,
    this.image,
    this.speciality,
    this.location,
    this.patientsServed,
    this.yearsOfExperience,
    this.rating,
    this.numberOfReviews,
    // this.availability
  });

  DoctorDetailsModel.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctor_name'];
    image = json['image'];
    speciality = json['speciality'];
    location = json['location'];
    patientsServed = json['patients_served'];
    yearsOfExperience = json['years_of_experience'];
    rating = json['rating'];
    numberOfReviews = json['number_of_reviews'];
    // availability = json['availability'] != null
    //     ? Availability.fromJson(json['availability'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['doctor_name'] = doctorName;
    data['image'] = image;
    data['speciality'] = speciality;
    data['location'] = location;
    data['patients_served'] = this.patientsServed;
    data['years_of_experience'] = this.yearsOfExperience;
    data['rating'] = this.rating;
    data['number_of_reviews'] = this.numberOfReviews;
    // if (this.availability != null) {
    //   data['availability'] = this.availability!.toJson();
    // }
    return data;
  }
}

// class Availability {
//   List<String>? l20230918;
//   List<Null>? l20230919;
//   List<String>? l20230920;
//   List<String>? l20230921;

//   Availability(
//       {this.l20230918, this.l20230919, this.l20230920, this.l20230921});

//   Availability.fromJson(Map<String, dynamic> json) {
//     l20230918 = json['2023-09-18'].cast<String>();
//     if (json['2023-09-19'] != null) {
//       l20230919 = <Null>[];
//       json['2023-09-19'].forEach((v) {
//         l20230919!.add(  Null.fromJson(v));
//       });
//     }
//     l20230920 = json['2023-09-20'].cast<String>();
//     l20230921 = json['2023-09-21'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['2023-09-18'] = this.l20230918;
//     if (this.l20230919 != null) {
//       data['2023-09-19'] = this.l20230919!.map((v) => v!.toJson()).toList();
//     }
//     data['2023-09-20'] = this.l20230920;
//     data['2023-09-21'] = this.l20230921;
//     return data;
//   }
// }
