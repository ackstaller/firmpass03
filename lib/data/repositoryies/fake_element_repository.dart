import 'package:my_app/data/models/firm_element.dart';
import 'package:my_app/data/models/firmuser.dart';
import 'package:my_app/data/repositoryies/element_repository.dart';

class FakeElementRepository implements ElementRepository {
  final List<FirmElement> _elements = [
    FirmElement("1", "1. Firmstunde", DateTime(2024, 1, 23),
        ElementType.firmstunde, FirmGroup.monday, DateTime(2024)),
    FirmElement("2", "1. Firmstunde", DateTime(2024, 1, 23),
        ElementType.firmstunde, FirmGroup.tuesday, DateTime(2024)),
    FirmElement("3", "1. Firmstunde", DateTime(2024, 1, 23),
        ElementType.firmstunde, FirmGroup.wednesday, DateTime(2024)),
    FirmElement("4", "1. Firmstunde", DateTime(2024, 1, 23),
        ElementType.firmstunde, FirmGroup.thrusday, DateTime(2024)),
    FirmElement("5", "1. Firmstunde", DateTime(2024, 1, 23),
        ElementType.firmstunde, FirmGroup.friday, DateTime(2024)),
    FirmElement("6", "2. Firmstunde", DateTime(2024, 1, 30),
        ElementType.firmstunde, FirmGroup.monday, DateTime(2024)),
    FirmElement("7", "2. Firmstunde", DateTime(2024, 1, 30),
        ElementType.firmstunde, FirmGroup.tuesday, DateTime(2024)),
    FirmElement("8", "2. Firmstunde", DateTime(2024, 1, 30),
        ElementType.firmstunde, FirmGroup.wednesday, DateTime(2024)),
    FirmElement("9", "2. Firmstunde", DateTime(2024, 1, 30),
        ElementType.firmstunde, FirmGroup.thrusday, DateTime(2024)),
    FirmElement("10", "2. Firmstunde", DateTime(2024, 1, 30),
        ElementType.firmstunde, FirmGroup.friday, DateTime(2024)),
    FirmElement("11", "3. Firmstunde", DateTime(2024, 3, 6),
        ElementType.firmstunde, FirmGroup.monday, DateTime(2024)),
    FirmElement("12", "3. Firmstunde", DateTime(2024, 3, 6),
        ElementType.firmstunde, FirmGroup.tuesday, DateTime(2024)),
    FirmElement("13", "3. Firmstunde", DateTime(2024, 3, 6),
        ElementType.firmstunde, FirmGroup.wednesday, DateTime(2024)),
    FirmElement("14", "3. Firmstunde", DateTime(2024, 3, 6),
        ElementType.firmstunde, FirmGroup.thrusday, DateTime(2024)),
    FirmElement("15", "3. Firmstunde", DateTime(2024, 3, 6),
        ElementType.firmstunde, FirmGroup.friday, DateTime(2024)),
    FirmElement("16", "Mister X", DateTime(2024, 5, 7), ElementType.ausflug,
        FirmGroup.all, DateTime(2024)),
  ];

  FakeElementRepository();

  @override
  void addElement(FirmElement firmElement) {}

  @override
  void deleteElementById(String id) {
    _elements.removeWhere((FirmElement) => FirmElement.id == id);
  }

  @override
  List<FirmElement> getAllElements() {
    _sortByDate();
    return _elements;
  }

  @override
  FirmElement? getElementById(String id) {
    for (FirmElement firmElement in _elements) {
      if (firmElement.id == id) {
        return firmElement;
      }
    }
    return null;
  }

  @override
  void updateElement(FirmElement element) {
    final index = _elements.indexWhere((e1) => e1.id == element.id);

    if (index != -1) {
      _elements[index] = element;
    }
  }

  Future<List<FirmElement>> getAllFirmElementsFromMockServer() async {
    await Future.delayed(const Duration(seconds: 3));
    return _elements;
  }

  List<FirmElement> getNeededElements(FirmUser firmUser) {
    List<FirmElement> items = [];
    for (FirmElement element in getAllElements()) {
      if (element.firmGroup != FirmGroup.all &&
          element.firmGroup != FirmGroup.none &&
          element.firmGroup != firmUser.firmGroup) {
        continue;
      } else {
        items.add(element);
      }
    }
    return items;
  }

  void _sortByDate() {
    _elements.sort((e1, e2) {
      // Prüfen Sie, ob einer der Terminwerte null ist
      if (e1.erledigt_soll == null && e2.erledigt_soll == null) {
        return 0; // Beide Werte sind null, also sind sie gleich.
      }
      if (e1.erledigt_soll == null) {
        return 1; // Setzen Sie null-Werte ans Ende
      }
      if (e2.erledigt_soll == null) {
        return -1; // Setzen Sie null-Werte ans Ende
      }
      // Wenn keiner der Werte null ist, vergleichen Sie sie wie zuvor.
      return e1.erledigt_soll!.compareTo(e2.erledigt_soll!);
    });
  }

  @override
  FirmElement? getUsersNextFutureElement(FirmUser user) {
    final now = DateTime.now();
    FirmElement? nextElement;
    Duration? shortestDuration;

    for (FirmElement element in getNeededElements(user)) {
      final duration = element.erledigt_soll?.difference(now);
      if (duration != null && duration > Duration.zero) {
        if (shortestDuration == null || duration < shortestDuration) {
          shortestDuration = duration;
          nextElement = element;
        }
      }
    }

    return nextElement;
  }
}
