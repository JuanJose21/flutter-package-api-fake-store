class GeolocationModel {
  String lat;
  String long;

  GeolocationModel({
    required this.lat,
    required this.long,
  });

  /// Convert a json to a GeolocationModel object
  factory GeolocationModel.fromJson(Map<String, dynamic> json) =>
      GeolocationModel(
        lat: json["lat"],
        long: json["long"],
      );

  /// Convert a GeolocationModel object to a json
  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}
