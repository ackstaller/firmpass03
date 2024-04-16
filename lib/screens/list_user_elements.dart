import 'package:flutter/material.dart';
import 'package:my_app/data/models/firm_element.dart';
import 'package:my_app/data/models/firmuser.dart';
import 'package:my_app/data/repositoryies/fake_element_repository.dart';

class ListUserElementsScreen extends StatefulWidget {
  const ListUserElementsScreen({super.key});

  @override
  State<ListUserElementsScreen> createState() => _ListUserElementsScreenState();
}

class _ListUserElementsScreenState extends State<ListUserElementsScreen> {
  final elementsRepo = FakeElementRepository();
  List<FirmElement> firm_elements = [];
  FirmUser? firmUser;

  @override
  void initState() {
    super.initState();
    firmUser = FirmUser(
        id: "id",
        name: "name",
        doneElements: [],
        userType: UserType.firmling,
        username: "username",
        firmGroup: FirmGroup.friday);
    if (firmUser != null) {
      firm_elements = elementsRepo.getNeededElements(firmUser!);
    }
  }

  Widget statusBasedListTile(FirmElement element) {
    bool isDone = firmUser?.hasDoneElment(element) ?? false;
    bool isPast = element.erledigt_soll?.isBefore(DateTime.now()) ?? false;

    IconData iconData;
    Color iconColor;
    if (isDone) {
      iconData = Icons.check_circle; // Erledigt
      iconColor = Colors.green;
    } else if (isPast) {
      iconData = Icons.error; // Nicht erledigt und in der Vergangenheit
      iconColor = Colors.red;
    } else {
      iconData = Icons.schedule; // Zukünftig oder nicht erledigt
      iconColor = Colors.orange;
    }

    return Card(
      elevation: 4, // Fügt einen Schatten hinzu für eine "erhöhte" Optik
      margin: const EdgeInsets.all(8), // Außenabstand für jede Karte
      child: ListTile(
        leading:
            Icon(iconData, color: iconColor), // Icon basierend auf dem Status
        title: Text(element.name),
        subtitle: isDone && element.erledigt_ist != null
            ? Text("Erledigt am ${element.erledigt_ist}")
            : Text(
                "Fällig am ${element.erledigt_soll}"), // Zeigt die ID als Untertitel
        trailing: isPast && !isDone
            ? const Icon(Icons.warning, color: Colors.red)
            : null, // Zusätzliches Icon für vergangene, nicht erledigte Elemente
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Übersicht",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: firm_elements.length,
          itemBuilder: (BuildContext context, int index) {
            return statusBasedListTile(firm_elements[index]);
          },
        ));
  }
}
