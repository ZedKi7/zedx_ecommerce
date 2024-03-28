class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Empty Helper Function
  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

  /// Convert model to Json structure to store in Firestore
  Map<String, dynamic> toJson() => {
        'Id': id,
        'SKU': sku,
        'Image': image,
        'Description': description,
        'Price': price,
        'SalePrice': salePrice,
        'Stock': stock,
        'AttributeValues': attributeValues,
      };

  /// Map Json oriented document snapshot from Firestore to ProductVariationModel
  factory ProductVariationModel.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) return ProductVariationModel.empty();

    return ProductVariationModel(
      id: data['Id'] ?? '',
      sku: data['SKU'] ?? '',
      image: data['Image'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      stock: data['Stock'] ?? 0,
      attributeValues: Map<String, String>.from(data['AttributeValues']),
    );
  }
}
