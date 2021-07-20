class Api {
  static const String _baseURL =
      "https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=";

  static String get newArrivals => "${_baseURL}newArrivals";
  static String get newShops => "${_baseURL}newShops";
  static String get products => "${_baseURL}stories";
  static String get trendingProducts => "${_baseURL}trendingProducts";
  static String get trendingSellers => "${_baseURL}trending_seller";
}
