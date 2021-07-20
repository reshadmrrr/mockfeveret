class TrendingProductModel {
  String productName;
  String shortDetails;
  String productImage;
  TrendingProductModel({
    this.productName = '',
    this.shortDetails = '',
    this.productImage = '',
  });

  factory TrendingProductModel.fromMap(Map<String, dynamic> map) {
    return TrendingProductModel(
      productName: map['productName'] ?? '',
      shortDetails: map['shortDetails'] ?? '',
      productImage: map['productImage'] ?? '',
    );
  }
}
