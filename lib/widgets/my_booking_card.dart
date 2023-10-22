import 'package:flutter/material.dart';
import 'package:internship/api/api.dart';
import 'package:internship/model/my_booking_model.dart';
import 'package:internship/util/dateformat.dart';

class MyBookingCard extends StatelessWidget {
  final MyBookingModel bookings;
  const MyBookingCard({
    Key? key,
    required this.bookings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 1;
    double _width = MediaQuery.of(context).size.width * 1;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "${Util.formatDate(bookings.appointmentDate.toString())} - ${bookings.appointmentTime.toString().substring(0, 8)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      16.0), // Adjust the radius as needed
                  child: Image.network(
                    height: _height * 0.1,
                    width: _width * 0.2,
                    Api.doctorimage[bookings.doctorName].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookings.doctorName.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.blue,
                        ),
                        Text(
                          bookings.location.toString(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.qr_code_scanner,
                          color: Colors.blue,
                        ),
                        Text(
                          "Booking ID:",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "#DR" + bookings.bookingId.toString(),
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    minWidth: _width * .3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    color: Colors.blue.shade100,
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.blue),
                    )),
                MaterialButton(
                    minWidth: _width * .3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    color: Colors.blue,
                    onPressed: () {},
                    child: Text(
                      "Reschedule",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
