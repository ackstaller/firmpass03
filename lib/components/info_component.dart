import 'package:flutter/material.dart';
import 'package:my_app/data/models/firm_element.dart';
import 'package:my_app/data/models/firmuser.dart';
import 'package:my_app/data/repositoryies/fake_element_repository.dart';

class InfoScreen extends StatelessWidget {
  final FirmUser firmUser;

  const InfoScreen({super.key, required this.firmUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        const Text(
          "Nächste Veranstaltung: ",
          style: TextStyle(fontSize: 22),
        ),
        Text(nextVeranstaltungDate(),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        Text(
          nextVeranstaltungTitle(),
          style: const TextStyle(fontSize: 22),
        ),
      ],
    );
  }

  String nextVeranstaltungTitle() {
    FirmElement? element =
        FakeElementRepository().getUsersNextFutureElement(firmUser);
    if (element != null) {
      return element.name;
    }
    return "FEHLER";
  }

  String nextVeranstaltungDate() {
    FirmElement? element =
        FakeElementRepository().getUsersNextFutureElement(firmUser);
    if (element != null) {
      return element.erledigt_soll.toString();
    }
    return "FEHLER";
  }
}
