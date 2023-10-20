import 'package:flutter/material.dart';
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
            SelectDuration(),
          ]),
        ));
  }
}