class ProductModel {
  String story;
  String storyImage;
  String shopName;
  ProductModel({
    this.story = '',
    this.storyImage = '',
    this.shopName = '',
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      story: map['story'] ?? '',
      storyImage: map['storyImage'] ?? '',
      shopName: map['shopName'] ?? '',
    );
  }
}
