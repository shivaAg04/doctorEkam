import 'package:flutter/material.dart';
import 'package:internship/model/doctor_details_model.dart';
import 'package:internship/screen/select_package.dart';
import 'package:internship/widgets/doctor_specification_button.dart';

class CurvedBlueTick extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width / 3, size.height)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BookAppointmentScreen extends StatefulWidget {
  DoctorDetailsModel? d;
  BookAppointmentScreen({super.key, required this.d});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
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
            const Spacer(),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectPackageScreen(),
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
            )
          ],
        ),
      ),
    );
  }
}
