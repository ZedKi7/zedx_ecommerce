import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.active,
    required this.targetScreen,
  });

  /// Convert model to Json structure to store in Firestore
  Map<String, dynamic> toJson() => {
        'ImageUrl': imageUrl,
        'TargetScreen': targetScreen,
        'Active': active,
      };

  /// Map Json oriented document snapshot from Firestore to BannerModel
  factory BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: data["ImageUrl"] ?? '',
      targetScreen: data["TargetScreen"] ?? '',
      active: data["Active"] ?? false,
    );
  }
}
