class MyBookingModel {
  String? bookingId;
  String? doctorName;
  String? location;
  String? appointmentDate;
  String? appointmentTime;

  MyBookingModel(
      {this.bookingId,
      this.doctorName,
      this.location,
      this.appointmentDate,
      this.appointmentTime});

  MyBookingModel.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    doctorName = json['doctor_name'];
    location = json['location'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['booking_id'] = bookingId;
    data['doctor_name'] = doctorName;
    data['location'] = location;
    data['appointment_date'] = appointmentDate;
    data['appointment_time'] = appointmentTime;
    return data;
  }
}
