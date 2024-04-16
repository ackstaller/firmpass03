enum ElementType { firmstunde, ausflug, soziales, gottesdienst, firmsonntag }

enum FirmGroup { monday, tuesday, wednesday, thrusday, friday, all, none }

extension FirmGroupExtension on FirmGroup {
  Map<String, dynamic> toMap() {
    return {'index': this.index};
  }

  static FirmGroup fromMap(Map<String, dynamic> map) {
    return FirmGroup.values[map['index'] as int];
  }
}

class FirmElement {
  final String id;
  final String name;
  DateTime? erledigt_soll;
  DateTime? erledigt_ist;
  final ElementType type;
  final FirmGroup firmGroup;

  FirmElement(
    this.id,
    this.name,
    this.erledigt_soll,
    this.type,
    this.firmGroup,
    this.erledigt_ist,
  );

  toMap() {}
}
