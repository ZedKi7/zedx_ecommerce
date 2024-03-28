import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  /// Convert model to Json structure to store in Firestore
  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Image': image,
        'IsFeatured': isFeatured,
        'ProductsCount': productsCount,
      };

  /// Map Json oriented document snapshot from Firestore to BrandModel
  factory BrandModel.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) return BrandModel.empty();

    return BrandModel(
      id: data["Id"] ?? '',
      name: data["Name"] ?? '',
      image: data["Image"] ?? '',
      isFeatured: data["IsFeatured"] ?? false,
      productsCount: data["ProductsCount"] ?? 0,
    );
  }

  /// Map Json oriented document snapshot from Firestore to BrandModel
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;
      return BrandModel(
        id: data["Id"] ?? '',
        name: data["Name"] ?? '',
        image: data["Image"] ?? '',
        isFeatured: data["IsFeatured"] ?? false,
        productsCount: data["ProductsCount"] ?? 0,
      );
    } else {
      return BrandModel.empty();
    }
  }
}
