import 'dart:convert';

class NewShopModel {
  String sellerName;
  String sellerProfilePhoto;
  String sellerItemPhoto;
  NewShopModel({
    this.sellerName = '',
    this.sellerProfilePhoto = '',
    this.sellerItemPhoto = '',
  });

  factory NewShopModel.fromJson(String source) =>
      NewShopModel.fromMap(json.decode(source));

  factory NewShopModel.fromMap(Map<String, dynamic> map) {
    return NewShopModel(
      sellerName: map['sellerName'] ?? '',
      sellerProfilePhoto: map['sellerProfilePhoto'] ?? '',
      sellerItemPhoto: map['sellerItemPhoto'] ?? '',
    );
  }
}
