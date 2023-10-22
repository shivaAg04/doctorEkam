import 'package:flutter/material.dart';
import 'package:internship/api/api.dart';
import 'package:internship/model/reviewdataModel.dart';

class SelectDuration extends StatefulWidget {
  @override
  State<SelectDuration> createState() => _SelectDurationState();
}

class _SelectDurationState extends State<SelectDuration> {
  String selectedItem = Api.duration[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedItem,
          items: Api.duration.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  const Icon(
                    Icons.watch_later,
                    color: Colors.blue,
                  ),
                  Text("  " + item),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedItem = newValue!;
              ReviewDataModel.rm.duration = selectedItem;
            });
          },
        ),
      ),
    );
  }
}
