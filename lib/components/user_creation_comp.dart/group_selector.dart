import 'package:flutter/material.dart';
import 'package:my_app/data/models/firm_element.dart';

class GroupSelector extends StatelessWidget {
  const GroupSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        items: const [
          DropdownMenuItem(value: FirmGroup.monday, child: Text("Montag")),
          DropdownMenuItem(value: FirmGroup.tuesday, child: Text("Dienstag")),
          DropdownMenuItem(value: FirmGroup.wednesday, child: Text("Mittwoch")),
          DropdownMenuItem(
              value: FirmGroup.thrusday, child: Text("Donnerstag")),
          DropdownMenuItem(value: FirmGroup.friday, child: Text("Freitag"))
        ],
        onChanged: (value) {
          print(value);
        });
  }
}
