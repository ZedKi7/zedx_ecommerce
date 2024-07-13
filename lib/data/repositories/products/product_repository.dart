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

  /// Get all featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((documentSnapshot) => ProductModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw ZFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ZPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Fetch Products By Query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      return querySnapshot.docs.map((documentSnapshot) => ProductModel.fromQuerySnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw ZFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ZPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Fetch Products By Query
  Future<List<ProductModel>> getFavoriteProducts(List<String> productIds) async {
    try {
      final querySnapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return querySnapshot.docs.map((documentSnapshot) => ProductModel.fromQuerySnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw ZFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ZPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Get products for a brand
  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
          : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();
      return querySnapshot.docs.map((documentSnapshot) => ProductModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw ZFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ZPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Get products for a category
  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = -1}) async {
    try {
      final productCategoryQuery = limit == -1
          ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
          : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();

      List<ProductModel> products = productsQuery.docs.map((documentSnapshot) => ProductModel.fromSnapshot(documentSnapshot)).toList();

      return products;
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
