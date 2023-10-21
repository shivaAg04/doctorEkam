import 'package:flutter/material.dart';
import 'package:internship/screen/confirmation_screen.dart';
import 'package:internship/screen/my_bookings_screen.dart';
import 'package:internship/widgets/radio_button.dart';
import 'package:internship/widgets/select_duration.dart';

class SelectPackageScreen extends StatefulWidget {
  const SelectPackageScreen({super.key});

  @override
  State<SelectPackageScreen> createState() => _SelectPackageScreenState();
}

class _SelectPackageScreenState extends State<SelectPackageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Select Package')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Select Duration  ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            SelectDuration(),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Select Package',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: RadioButtonGroup()),
            MaterialButton(
              minWidth: double.infinity,
              //convert it circular button
              shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  1),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationScreen(),
                  ),
                );
              },
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ));
  }
}
