import 'package:my_app/data/models/firm_element.dart';
import 'package:my_app/data/models/firmuser.dart';

abstract class UserRepository {
  FirmUser? getUserById(String id);

  List<FirmUser> getAllUser();

  List<FirmUser> getAllUserOfType(UserType userType);

  List<FirmUser> getAllUserOfDay(FirmGroup groupDay);

  void addUser(FirmUser firmUser);

  void deleteUserById(String id);

  void updateUser(FirmUser user);

  void createUser(String name, DateTime birthDay);
}
