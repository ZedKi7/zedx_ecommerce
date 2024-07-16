class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId = '',
    this.image,
    this.price = 0.0,
    this.title = '',
    this.brandName,
    this.selectedVariation,
  });

  /// Empty Helper Function
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  /// Convert model to Json structure to store in Firestore
  Map<String, dynamic> toJson() => {
        'productId': productId,
        'title': title,
        'price': price,
        'image': image,
        'quantity': quantity,
        'variationId': variationId,
        'brandName': brandName,
        'selectedVariation': selectedVariation,
      };

  /// Map Json oriented document snapshot from Firestore to CartItemModel
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json["productId"],
      title: json["title"],
      image: json["image"],
      price: json["price"]?.toDouble(),
      quantity: json["quantity"],
      variationId: json["variationId"],
      brandName: json["brandName"],
      selectedVariation: json["selectedVariation"] != null ? Map<String, String>.from(json["selectedVariation"]) : null,
    );
  }
}
