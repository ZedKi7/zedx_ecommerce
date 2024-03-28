class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({
    this.name,
    this.values,
  });

  /// Convert model to Json structure to store in Firestore
  Map<String, dynamic> toJson() => {'Name': name, 'Values': values};

  /// Map Json oriented document snapshot from Firestore to ProductAttributeModel
  factory ProductAttributeModel.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data.containsKey("Name") ? data["Name"] : '',
      values: List<String>.from(data["Values"]),
    );
  }
}
