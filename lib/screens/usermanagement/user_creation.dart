import 'package:flutter/material.dart';
import 'package:my_app/data/models/firm_element.dart';
import 'package:my_app/data/models/firmuser.dart';

class UserCreationScreen extends StatefulWidget {
  const UserCreationScreen({super.key});

  @override
  State<UserCreationScreen> createState() => _UserCreationScreenState();
}

class _UserCreationScreenState extends State<UserCreationScreen> {
  final _formKey = GlobalKey<FormState>();

  String? currentVorName;
  String? currentNachName;
  FirmGroup? currentGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Neuen Benutzer anlegen"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: "Vorname"),
                onChanged: (value) {
                  currentVorName = value;
                },
                validator: (value) {
                  return value == null || value == ""
                      ? "Bitte Vornamen angeben!"
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Nachname"),
                onChanged: (value) {
                  currentNachName = value;
                },
                validator: (value) {
                  return value == null || value == ""
                      ? "Bitte Nachnamen angeben!"
                      : null;
                },
              ),
              DropdownButtonFormField<FirmGroup>(
                items: const [
                  DropdownMenuItem(
                      value: FirmGroup.monday, child: Text("Montag")),
                  DropdownMenuItem(
                      value: FirmGroup.tuesday, child: Text("Dienstag")),
                  DropdownMenuItem(
                      value: FirmGroup.wednesday, child: Text("Mittwoch")),
                  DropdownMenuItem(
                      value: FirmGroup.thrusday, child: Text("Donnerstag")),
                  DropdownMenuItem(
                      value: FirmGroup.friday, child: Text("Freitag"))
                ],
                onChanged: (FirmGroup? value) {
                  print(value);
                  currentGroup = value;
                },
                validator: (value) {
                  return value == null ? "Bitte Firmgruppe angeben!" : null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      String completeName = "$currentVorName $currentNachName";
                      String username =
                          "$currentVorName.$currentNachName@acksmi.de";
                      final user = FirmUser(
                          id: "test",
                          name: completeName,
                          doneElements: [],
                          userType: UserType.firmling,
                          username: username,
                          firmGroup: currentGroup!);

                      print(user.toString());
                    }
                  },
                  child: const Text("Speichern"))
            ],
          ),
        ),
      )),
    );
  }
}
