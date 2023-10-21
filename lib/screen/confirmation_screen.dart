import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internship/api/api.dart';
import 'package:internship/model/confirmation_model.dart';
import 'package:internship/screen/my_bookings_screen.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height * 1;
    double _width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Confirmation "),
      ),
      body: FutureBuilder<ConfirmationModel>(
        future: Api.getConfirmationDetail(),
        builder:
            (BuildContext context, AsyncSnapshot<ConfirmationModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: _height * .1,
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      "Appointment Confirmed!",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const Text(
                    "You have successfully booked an appointment with",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      snapshot.data!.doctorName.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
                    child: Column(
                      children: [
                        Row(children: [
                          const Icon(
                            Icons.tap_and_play_rounded,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 10),
                          Text(snapshot.data!.appointmentPackage.toString()),
                          const SizedBox(
                            width: 50,
                          ),
                          const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 10),
                          Text(snapshot.data!.location.toString()),
                        ]),
                        const SizedBox(height: 10),
                        Row(children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 10),
                          Text(snapshot.data!.appointmentDate.toString()),
                          const SizedBox(
                            width: 50,
                          ),
                          const Icon(
                            Icons.watch_later,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 10),
                          Text(snapshot.data!.appointmentTime.toString()),
                        ]),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Spacer(),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyBookingsScreen(),
                        ),
                      );
                    },
                    color: Colors.blue,
                    minWidth: _width * .9,
                    child: const Text(
                      'View Appointments',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text("Book Another"))
                ],
              );
            }
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
