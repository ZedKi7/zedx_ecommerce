import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((documentSnapshot) => ProductModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw ZFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ZPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Upload products to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {}
}
