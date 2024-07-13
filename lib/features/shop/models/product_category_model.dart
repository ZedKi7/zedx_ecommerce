import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  String productId;
  String categoryId;

  ProductCategoryModel({
    required this.productId,
    required this.categoryId,
  });

  /// Convert model to Json structure to store in Firestore
  Map<String, dynamic> toJson() => {
        'productId': productId,
        'categoryId': categoryId,
      };

  /// Map Json oriented document snapshot from Firestore to ProductCategoryModel
  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return ProductCategoryModel(
      productId: data["productId"] as String,
      categoryId: data["categoryId"] as String,
    );
  }
}
