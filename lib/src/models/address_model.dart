import 'package:flutter_package_api_fake_store/src/models/geolocation_model.dart';

class AddressModel {
  String city;
  String street;
  int number;
  String zipcode;
  GeolocationModel geolocation;

  AddressModel({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  /// Convert a json to a AddressModel object
  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        city: json["city"],
        street: json["street"],
        number: json["number"],
        zipcode: json["zipcode"],
        geolocation: GeolocationModel.fromJson(json["geolocation"]),
      );

  /// Convert a AddressModel object to a json
  Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        "number": number,
        "zipcode": zipcode,
        "geolocation": geolocation.toJson(),
      };
}
