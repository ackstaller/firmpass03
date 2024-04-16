import 'package:flutter/material.dart';
import 'package:my_app/components/info_component.dart';
import 'package:my_app/components/overview_component.dart';
import 'package:my_app/data/models/firm_element.dart';
import 'package:my_app/data/models/firmuser.dart';
import 'package:my_app/data/repositoryies/fake_element_repository.dart';
import 'package:my_app/screens/loading_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final elementsRepo = FakeElementRepository();
  List<FirmElement> firm_elements = [];

  @override
  void initState() {
    super.initState();
    firm_elements = FakeElementRepository().getAllElements();
  }

  @override
  Widget build(BuildContext context) {
    FirmUser? user = FirmUser(
        id: "id",
        name: "name",
        doneElements: [],
        userType: UserType.firmling,
        username: "username",
        firmGroup: FirmGroup.friday);

    if (user == null) {
      return const Scaffold(
        body:
            SafeArea(child: Center(child: Text("Ein Fehler ist aufgetreten"))),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Firmpass - Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            InfoScreen(
              firmUser: user,
            ),
            Center(
              child: SizedBox(
                width: 180,
                height: 180,
                child: QrImageView(data: user.id),
              ),
            ),
            OverviewScreen(firmUser: user),
            ElevatedButton(
              onPressed: () async {
                //LogoutFunction
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
