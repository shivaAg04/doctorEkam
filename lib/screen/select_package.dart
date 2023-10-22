import 'package:flutter/material.dart';
import 'package:internship/model/doctor_details_model.dart';
import 'package:internship/model/reviewdataModel.dart';
import 'package:internship/screen/confirmation_screen.dart';
import 'package:internship/screen/review_summary_screen.dart';
import 'package:internship/util/dateformat.dart';

import 'package:internship/widgets/radio_button.dart';
import 'package:internship/widgets/select_duration.dart';

class SelectPackageScreen extends StatefulWidget {
  DoctorDetailsModel? d;
  SelectPackageScreen({super.key, required this.d});

  @override
  State<SelectPackageScreen> createState() => _SelectPackageScreenState();
}

class _SelectPackageScreenState extends State<SelectPackageScreen> {
  @override
  Widget build(BuildContext context) {
    ReviewDataModel.rm.doctor_name = widget.d!.doctorName.toString();
    ReviewDataModel.rm.speciality = widget.d!.speciality.toString();
    ReviewDataModel.rm.location = widget.d!.location.toString();

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
              height: 50,
              minWidth: double.infinity,
              //convert it circular button
              shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  1),
              color: Colors.blue,
              onPressed: () {
                if (ReviewDataModel.rm.package != '') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewSummaryScreen(),
                    ),
                  );
                }
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
