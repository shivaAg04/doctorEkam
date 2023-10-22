import 'package:flutter/material.dart';
import 'package:internship/model/reviewdataModel.dart';
import 'package:internship/screen/confirmation_screen.dart';
import 'package:internship/util/dateformat.dart';

class ReviewSummaryScreen extends StatelessWidget {
  const ReviewSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReviewDataModel rm = ReviewDataModel.rm;
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            // Circular avatar image
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                rm.doctor_image.toString(),
                              ), // Replace with your image asset
                              radius: 50, // Adjust the radius as needed
                            ),
                            // Blue tick icon
                            Positioned(
                              bottom: 0, // Adjust position as needed
                              right: 0, // Adjust position as needed
                              child: Container(
                                padding: const EdgeInsets.all(
                                    4), // Adjust padding as needed
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rm.doctor_name.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              rm.speciality.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blue,
                                ),
                                Text(
                                  rm.location.toString(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Date & Time',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  Util.formatDate(rm.date.toString()) +
                      "|" +
                      rm.time.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Package',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  rm.package.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Duration',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  rm.duration.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Booking for',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "self",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            Divider(),
            Spacer(),
            MaterialButton(
              minWidth: width * .8,
              color: Colors.blue, // Replace with your color
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) {
                    return const ConfirmationScreen();
                  }),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
