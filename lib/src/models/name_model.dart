class NameModel {
  String firstname;
  String lastname;

  NameModel({
    required this.firstname,
    required this.lastname,
  });

  /// Convert a json to a NameModel object
  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  /// Convert a NameModel object to a json
  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
      };
}
