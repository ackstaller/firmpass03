import 'package:flutter/material.dart';
import 'package:my_app/data/models/firm_element.dart';
import 'package:my_app/data/repositoryies/fake_element_repository.dart';

class ListElementsScreen extends StatefulWidget {
  const ListElementsScreen({super.key});

  @override
  State<ListElementsScreen> createState() => _ListElementsScreenState();
}

class _ListElementsScreenState extends State<ListElementsScreen> {
  final elementsRepo = FakeElementRepository();
  List<FirmElement> firm_elements = [];

  @override
  void initState() {
    super.initState();
    firm_elements = FakeElementRepository().getAllElements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Alle Termine",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: firm_elements.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 50,
                width: 30,
                color: Colors.yellow,
                child: Text(firm_elements[index].name));
          },
        ));
  }
}
