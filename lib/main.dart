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
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.blue),
            titleTextStyle: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),

            color: Colors.white, // Background color of the app bar
            // Elevation/shadow of the app bar
          ),
          primaryColor: Colors.blue,
          primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
