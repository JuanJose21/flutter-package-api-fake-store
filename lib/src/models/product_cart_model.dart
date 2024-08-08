class ProductCartModel {
  int productId;
  int quantity;

  ProductCartModel({
    required this.productId,
    required this.quantity,
  });

  /// Convert a json to a ProductCartModel object
  factory ProductCartModel.fromJson(Map<String, dynamic> json) =>
      ProductCartModel(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  /// Convert a ProductCartModel object to a json
  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
