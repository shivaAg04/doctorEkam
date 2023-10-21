import 'package:flutter/material.dart';
import 'package:internship/screen/confirmation_screen.dart';
import 'package:internship/screen/home_screen.dart';
import 'package:internship/screen/my_bookings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'Doctor Appointment App',
      theme: ThemeData(primaryColor: Colors.blue, useMaterial3: true),
      home: HomeScreen(),
    );
  }
}
