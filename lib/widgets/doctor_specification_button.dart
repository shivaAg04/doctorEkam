import 'package:flutter/material.dart';

class DoctorSpecificationButton extends StatelessWidget {
  IconData? icon;
  String? text1;
  String? text2;
  DoctorSpecificationButton({super.key, this.icon, this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          child: Icon(
            icon,
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$text1+", // Replace with your desired text
          style: TextStyle(
              fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        Text(
          text2!, // Replace with your desired text
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}
