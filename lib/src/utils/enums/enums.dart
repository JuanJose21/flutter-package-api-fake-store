/// EnumValues class is used to convert enum values to string and vice versa.
class EnumValues<T> {
  /// Map of enum values
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  /// Get the reverse map
  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
