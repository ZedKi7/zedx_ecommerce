import 'package:cloud_firestore/cloud_firestore.dart';

import 'brand_model.dart';
import 'product_attribute_model.dart';
import 'product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.date,
    this.brand,
    this.isFeatured,
    this.salePrice = 0.0,
    this.description,
    this.categoryId,
    this.images,
    this.productAttributes,
    this.productVariations,
  });

  /// Empty Helper Function
  static ProductModel empty() => ProductModel(id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');

  /// Convert model to Json structure to store in Firestore
  Map<String, dynamic> toJson() => {
        'Stock': stock,
        'SKU': sku,
        'Price': price,
        'Title': title,
        'SalePrice': salePrice,
        'Thumbnail': thumbnail,
        'IsFeatured': isFeatured,
        'Brand': brand!.toJson(),
        'Description': description,
        'CategoryId': categoryId,
        'Images': images ?? [],
        'ProductType': productType,
        'ProductAttributes': productAttributes != null ? productAttributes!.map((attribute) => attribute.toJson()).toList() : [],
        'ProductVariations': productVariations != null ? productVariations!.map((variation) => variation.toJson()).toList() : [],
      };

  /// Map Json oriented document snapshot from Firestore to ProductModel
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() == null) return ProductModel.empty();
    final data = documentSnapshot.data()!;
    return ProductModel(
      id: documentSnapshot.id,
      sku: data["SKU"],
      title: data["Title"],
      stock: data["Stock"] ?? 0,
      isFeatured: data["IsFeatured"] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data["Thumbnail"] ?? '',
      categoryId: data["CategoryId"] ?? '',
      description: data["Description"] ?? '',
      productType: data["ProductType"] ?? '',
      brand: BrandModel.fromJson(data["Brand"]),
      images: data["Images"] != null ? List<String>.from(data["Images"]) : [],
      productAttributes: (data["ProductAttributes"] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data["ProductVariations"] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }

  /// Map Json oriented document snapshot from Firestore to ProductModel
  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      sku: data["SKU"] ?? '',
      title: data["Title"] ?? '',
      stock: data["Stock"] ?? 0,
      isFeatured: data["IsFeatured"] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data["Thumbnail"] ?? '',
      categoryId: data["CategoryId"] ?? '',
      description: data["Description"] ?? '',
      productType: data["ProductType"] ?? '',
      brand: BrandModel.fromJson(data["Brand"]),
      images: data["Images"] != null ? List<String>.from(data["Images"]) : [],
      productAttributes: (data["ProductAttributes"] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data["ProductVariations"] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }
}
