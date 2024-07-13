import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  String brandId;
  String categoryId;

  BrandCategoryModel({
    required this.brandId,
    required this.categoryId,
  });

  /// Convert model to Json structure to store in Firestore
  Map<String, dynamic> toJson() => {
        'brandId': brandId,
        'categoryId': categoryId,
      };

  /// Map Json oriented document snapshot from Firestore to BrandCategoryModel
  factory BrandCategoryModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return BrandCategoryModel(
      brandId: data["brandId"] as String,
      categoryId: data["categoryId"] as String,
    );
  }
}
