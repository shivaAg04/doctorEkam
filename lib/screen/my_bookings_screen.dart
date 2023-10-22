import 'package:flutter/material.dart';
import 'package:internship/api/api.dart';
import 'package:internship/model/my_booking_model.dart';

import 'package:internship/widgets/my_booking_card.dart';

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
                  return MyBookingCard(
                    bookings: bookings[index],
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
