import 'package:my_app/data/models/firm_element.dart';
import 'package:my_app/data/models/firmuser.dart';

abstract class ElementRepository {
  FirmElement? getElementById(String id);

  List<FirmElement> getAllElements();

  void addElement(FirmElement firmElement);

  void deleteElementById(String id);

  void updateElement(FirmElement element);

  FirmElement? getUsersNextFutureElement(FirmUser user);
}
