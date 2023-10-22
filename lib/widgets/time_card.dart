import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  String time;
  bool is_selected;
  TimeCard({super.key, required this.time, required this.is_selected});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    return Container(
      width: 90,
      decoration: BoxDecoration(
        color: is_selected ? Colors.blue : Colors.grey,
        borderRadius:
            BorderRadius.circular(30), // Change this to make it circular
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          time,
          style: TextStyle(
              color: is_selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
