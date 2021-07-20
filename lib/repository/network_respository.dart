import 'package:dio/dio.dart';
import 'package:mockfeveret/models/new_arrival_model.dart';
import 'package:mockfeveret/models/new_shop_model.dart';
import 'package:mockfeveret/models/product_model.dart';
import 'package:mockfeveret/models/trending_product_model.dart';
import 'package:mockfeveret/models/trending_seller_model.dart';
import 'package:mockfeveret/utils/api.dart';

class NetworkRepository {
  final Dio dio = Dio();

  Future getNewArrivals() async {
    try {
      Response response = await dio.get(Api.newArrivals);
      List<NewArrivalModel> lists = (response.data[0] as List)
          .map((e) => NewArrivalModel.fromMap(e))
          .toList();
      return lists;
    } catch (e) {
      print(e);
    }
  }

  Future getNewShops() async {
    try {
      Response response = await dio.get(Api.newShops);
      List<NewShopModel> lists = (response.data[0] as List)
          .map((e) => NewShopModel.fromMap(e))
          .toList();
      return lists;
    } catch (e) {
      print(e);
    }
  }

  Future getProducts() async {
    try {
      Response response = await dio.get(Api.newShops);
      List<ProductModel> lists = (response.data[0] as List)
          .map((e) => ProductModel.fromMap(e))
          .toList();
      return lists;
    } catch (e) {
      print(e);
    }
  }

  Future getTrendingProducts() async {
    try {
      Response response = await dio.get(Api.newShops);
      List<TrendingProductModel> lists = (response.data[0] as List)
          .map((e) => TrendingProductModel.fromMap(e))
          .toList();
      return lists;
    } catch (e) {
      print(e);
    }
  }

  Future getTrendingSellers() async {
    try {
      Response response = await dio.get(Api.newShops);
      List<TrendingSellerModel> lists = (response.data[0] as List)
          .map((e) => TrendingSellerModel.fromMap(e))
          .toList();
      return lists;
    } catch (e) {
      print(e);
    }
  }
}
