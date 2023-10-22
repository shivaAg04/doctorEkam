import 'package:flutter/material.dart';
import 'package:internship/model/doctor_details_model.dart';
import 'package:internship/model/reviewdataModel.dart';
import 'package:internship/screen/select_package.dart';
import 'package:internship/util/dateformat.dart';

import 'package:internship/widgets/doctor_specification_button.dart';
import 'package:internship/widgets/time_card.dart';

class BookAppointmentScreen extends StatefulWidget {
  DoctorDetailsModel? d;
  BookAppointmentScreen({super.key, required this.d});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  static int curindex = 0;
  static int timeindex = 0;

  String key = "";

  @override
  Widget build(BuildContext context) {
    ReviewDataModel.rm.doctor_image = widget.d!.image.toString();
    List<String> keysList = widget.d!.availability!.avail.keys.toList();
    key = keysList[curindex];

    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Book Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    // Circular avatar image
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.d!.image.toString(),
                      ), // Replace with your image asset
                      radius: 50, // Adjust the radius as needed
                    ),
                    // Blue tick icon
                    Positioned(
                      bottom: 0, // Adjust position as needed
                      right: 0, // Adjust position as needed
                      child: Container(
                        padding:
                            const EdgeInsets.all(4), // Adjust padding as needed
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16, // Adjust icon size as needed
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: width * .09,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.d!.doctorName.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(widget.d!.speciality.toString()),
                    SizedBox(
                      height: height * .01,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                        Text(widget.d!.location.toString()),
                        const Icon(Icons.flag, color: Colors.blue),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DoctorSpecificationButton(
                    icon: Icons.people,
                    text1: widget.d!.patientsServed.toString(),
                    text2: 'Patients'),
                DoctorSpecificationButton(
                    icon: Icons.work_history_outlined,
                    text1: widget.d!.yearsOfExperience.toString(),
                    text2: 'Years Exp'),
                DoctorSpecificationButton(
                    icon: Icons.star_half_outlined,
                    text1: widget.d!.rating.toString(),
                    text2: 'Rating'),
                DoctorSpecificationButton(
                    icon: Icons.message_outlined,
                    text1: widget.d!.numberOfReviews.toString(),
                    text2: 'Reviw'),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Book Appointment',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ),
            //Day
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Day',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
                height: height * .07,
                width: double.infinity,
                child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.d!.availability!.avail.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          key = keysList[index];
                          curindex = index;
                          timeindex = 0;
                          print(index);
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TimeCard(
                              time: Util.Datformat(keysList[index].toString()),
                              is_selected: curindex == index ? true : false),
                        ),
                      );
                    })),

            //Time
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Time',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
                height: height * .07,
                width: double.infinity,
                child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.d!.availability!.avail[key]!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            timeindex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TimeCard(
                              time: widget.d!.availability!.avail[key]![index]
                                  .toString()
                                  .substring(0, 8),
                              is_selected: timeindex == index ? true : false),
                        ),
                      );
                    })),

            const Spacer(),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
                ReviewDataModel.rm.date = key;
                ReviewDataModel.rm.time = widget
                    .d!.availability!.avail[key]![timeindex]
                    .toString()
                    .substring(0, 8);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectPackageScreen(d: widget.d!),
                  ),
                );
              },
              color: Colors.blue,
              minWidth: width * .9,
              height: height * .07,
              child: const Text(
                'Make Appointment',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
