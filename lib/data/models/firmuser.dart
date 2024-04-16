import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:my_app/data/models/firm_element.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
enum UserType { admin, firmbegleiter, firmling }

class FirmUser {
  final String id;
  String name;
  final List<FirmElement> doneElements;
  UserType userType;
  final String username;
  FirmGroup firmGroup;
  FirmUser({
    required this.id,
    required this.name,
    required this.doneElements,
    required this.userType,
    required this.username,
    required this.firmGroup,
  });

  FirmUser copyWith({
    String? id,
    String? name,
    List<FirmElement>? doneElements,
    UserType? userType,
    String? username,
    FirmGroup? firmGroup,
  }) {
    return FirmUser(
      id: id ?? this.id,
      name: name ?? this.name,
      doneElements: doneElements ?? this.doneElements,
      userType: userType ?? this.userType,
      username: username ?? this.username,
      firmGroup: firmGroup ?? this.firmGroup,
    );
  }

  @override
  String toString() {
    return 'FirmUser(id: $id, name: $name, doneElements: $doneElements, userType: $userType, username: $username, firmGroup: $firmGroup)';
  }

  @override
  bool operator ==(covariant FirmUser other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.doneElements, doneElements) &&
        other.userType == userType &&
        other.username == username &&
        other.firmGroup == firmGroup;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        doneElements.hashCode ^
        userType.hashCode ^
        username.hashCode ^
        firmGroup.hashCode;
  }

  int getCountOfDoneElements(ElementType elementType) {
    return 0; //TODO Implement Method
  }

  bool hasDoneElment(FirmElement firmElement) {
    return false; //TODO Implement methdo
  }
}
