void main(List<String> args) {
  print(Api.getNewArrivals);
}

String baseURL =
    "https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=";

class Api {
  static String get getNewArrivals => "${baseURL}newArrivals";
  static String get getNewShops => "${baseURL}newShops";
  static String get getProduct => "${baseURL}stories";
  static String get getTrendingProducts => "${baseURL}trendingProducts";
  static String get getTrendingSellers => "${baseURL}trending_seller";
}
