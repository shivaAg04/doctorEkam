import 'package:flutter/material.dart';
import 'package:internship/api/api.dart';

class RadioButtonGroup extends StatefulWidget {
  @override
  _RadioButtonGroupState createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  List<String> title = [
    "Chat with Doctor",
    "Voice Call with Doctor",
    "Video Call with Doctor",
    "In Person with doctor"
  ];
  List<IconData> icon = [
    Icons.message,
    Icons.call,
    Icons.video_call,
    Icons.person
  ];
  int? selectedValue; // Keeps track of the selected radio button value.

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Api.package.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Icon(
                    icon[index],
                    color: Colors.blue,
                  ),
                ),
                title: Text(Api.package[index]),
                subtitle: Text(
                  title[index],
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Radio(
                  value: index,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
            ),
          );
        });
  }
}
