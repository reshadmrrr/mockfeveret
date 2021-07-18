import 'dart:convert';

class NewArrivalModel {
  String productName;
  String productImage;
  NewArrivalModel({
    this.productName = '',
    this.productImage = '',
  });

  factory NewArrivalModel.fromJson(String source) =>
      NewArrivalModel.fromMap(json.decode(source));

  factory NewArrivalModel.fromMap(Map<String, dynamic> map) {
    return NewArrivalModel(
      productName: map['productName'] ?? '',
      productImage: map['productImage'] ?? '',
    );
  }
}
