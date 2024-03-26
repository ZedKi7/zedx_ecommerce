import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  /// Empty Helper Function
  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', parentId: '', isFeatured: false);

  /// Convert model to Json structure to store in Firestore
  Map<String, dynamic> toJson() => {
        'Name': name,
        'Image': image,
        'ParentId': parentId,
        'IsFeatured': isFeatured,
      };

  /// Map Json oriented document snapshot from Firestore to CategoryModel
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;
      return CategoryModel(
        id: documentSnapshot.id,
        name: data["Name"] ?? '',
        image: data["Image"] ?? '',
        parentId: data["ParentId"] ?? '',
        isFeatured: data["IsFeatured"] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
