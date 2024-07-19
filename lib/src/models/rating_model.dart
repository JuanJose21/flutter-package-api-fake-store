class RatingModel {
  RatingModel({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  /// Convert a json to a RatingModel object
  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  /// Convert a RatingModel object to a json
  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
