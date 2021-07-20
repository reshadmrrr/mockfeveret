class ProductModel {
  String story;
  String storyImage;
  String shopName;
  int orderQty;
  int availableStock;
  int salesQty;
  ProductModel({
    this.story = '',
    this.storyImage = '',
    this.shopName = '',
    this.orderQty = 0,
    this.availableStock = 0,
    this.salesQty = 0,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      story: map['story'] ?? '',
      storyImage: map['storyImage'] ?? '',
      shopName: map['shopName'] ?? '',
      orderQty: map['orderQty'] ?? 0,
      availableStock: map['availableStock'] ?? 0,
      salesQty: map['salesQty'] ?? 0,
    );
  }
}
