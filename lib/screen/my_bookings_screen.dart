import 'package:flutter/material.dart';
import 'package:internship/api/api.dart';
import 'package:internship/model/my_booking_model.dart';
import 'package:internship/util/dateformat.dart';

class MyBookingsScreen extends StatefulWidget {
  @override
  _MyBookingsScreenState createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 1;
    double _width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              hoverColor: Colors.black,
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
        centerTitle: true,
        title: const Text('My Bookings'),
      ),
      body: FutureBuilder<List<MyBookingModel>>(
        future: Api.getMyBooking(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final bookings = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView.builder(
                itemCount: bookings!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${Util.formatDate(bookings[index].appointmentDate.toString())} - ${bookings[index].appointmentTime.toString().substring(0, 8)}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(
                                      10), // Change this to make it circular
                                ),
                                child: Image.network(
                                  height: _height * 0.1,
                                  width: _width * 0.2,
                                  Api.doctorimage[bookings[index].doctorName]
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bookings[index].doctorName.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.blue,
                                      ),
                                      Text(
                                        bookings[index].location.toString(),
                                        style: TextStyle(color: Colors.grey),
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
                                        "#DR" +
                                            bookings[index]
                                                .bookingId
                                                .toString(),
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
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  color: Colors.blue.shade100,
                                  onPressed: () {},
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.blue),
                                  )),
                              MaterialButton(
                                  minWidth: _width * .3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
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
                },
              ),
            );
          }
        },
      ),
    );
  }
}
