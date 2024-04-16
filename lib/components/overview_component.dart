import 'package:flutter/material.dart';
import 'package:my_app/data/models/constants.dart';
import 'package:my_app/data/models/firm_element.dart';
import 'package:my_app/screens/list_user_elements.dart';

import '../data/models/firmuser.dart';

class OverviewScreen extends StatelessWidget {
  final FirmUser firmUser;

  const OverviewScreen({super.key, required this.firmUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Definieren Sie hier, was passieren soll, wenn auf Gottesdienste geklickt wird
            print("Gottesdienste angeklickt");
          },
          child: Text(
            doneGottesdienste(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
          ),
        ),
        SizedBox(height: 10), // Fügt einen Abstand zwischen den Texten hinzu
        InkWell(
          onTap: () {
            // Definieren Sie hier, was passieren soll, wenn auf Firmstunden geklickt wird
            print("Firmstunden angeklickt");
          },
          child: Text(
            doneFirmStunden(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
          ),
        ),
        SizedBox(height: 10), // Fügt einen Abstand zwischen den Texten hinzu
        InkWell(
          onTap: () {
            // Definieren Sie hier, was passieren soll, wenn auf Firmsonntag geklickt wird
            print("Firmsonntag angeklickt");
          },
          child: Text(
            doneFirmSonntage(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
          ),
        ),
        SizedBox(height: 20), // Fügt einen größeren Abstand vor dem Knopf hinzu
        ElevatedButton(
          onPressed: () {
            // Definieren Sie hier, was passieren soll, wenn auf den Details-Knopf geklickt wird
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ListUserElementsScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Hintergrundfarbe des Knopfes
            disabledBackgroundColor: Colors.grey,
            foregroundColor: Colors.green, // Farbe des Textes/Icons im Knopf
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0), // Abrunden der Ecken
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 60, vertical: 15), // Innerer Abstand
          ),
          child: const Text(
            'Übersicht',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }

  String doneGottesdienste() {
    return "Gottesdienste ${firmUser.getCountOfDoneElements(ElementType.gottesdienst)} / ${FirmConstans().mingottesdienst} 🔥";
  }

  String doneFirmStunden() {
    return "Firmstunden ${firmUser.getCountOfDoneElements(ElementType.firmstunde)} / 12 🔥";
  }

  String doneFirmSonntage() {
    return "Firmsonntag ${firmUser.getCountOfDoneElements(ElementType.firmsonntag)} / 4 🔥";
  }
}
