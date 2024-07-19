class ProductCartModel {
  ProductCartModel({
    required this.productId,
    required this.quantity,
  });

  int productId;
  int quantity;

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
