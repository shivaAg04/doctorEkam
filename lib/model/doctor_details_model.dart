class DoctorDetailsModel {
  String? doctorName;
  String? image;
  String? speciality;
  String? location;
  int? patientsServed;
  int? yearsOfExperience;
  double? rating;
  int? numberOfReviews;
  Availaibility? availability;

  DoctorDetailsModel({
    this.doctorName,
    this.image,
    this.speciality,
    this.location,
    this.patientsServed,
    this.yearsOfExperience,
    this.rating,
    this.numberOfReviews,
    this.availability,
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
    availability = Availaibility.fromJson(json['availability']);
  }
}

class Availaibility {
  Map<String, List<dynamic>> avail = {};
  Availaibility({required this.avail});

  Availaibility.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      final temp = <String, List<dynamic>>{key: value as List<dynamic>};
      avail.addEntries(temp.entries);
    });
  }
}
