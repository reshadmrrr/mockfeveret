class TrendingSellerModel {
  String sellerName;
  String sellerProfilePhoto;
  String sellerItemPhoto;
  TrendingSellerModel({
    this.sellerName = '',
    this.sellerProfilePhoto = '',
    this.sellerItemPhoto = '',
  });

  factory TrendingSellerModel.fromMap(Map<String, dynamic> map) {
    return TrendingSellerModel(
      sellerName: map['sellerName'] ?? '',
      sellerProfilePhoto: map['sellerProfilePhoto'] ?? '',
      sellerItemPhoto: map['sellerItemPhoto'] ?? '',
    );
  }
}
