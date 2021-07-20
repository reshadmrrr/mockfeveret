import 'package:flutter/material.dart';
import 'package:mockfeveret/screens/home_screen/components/new_shops_listview/new_shops_listview.dart';

import 'components/new_arrival_listview/new_arrival_listview.dart';
import 'components/products/products.dart';
import 'components/trending_products_listview/trending_products_listview.dart';
import 'components/trending_seller_listview/trending_seller_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Text("Trending Sellers"),
            TrendingSellerListView(),
            Text("Trending Products"),
            TrendingProductListView(),
            Products(
              productCount: ProductCount.firstThree,
            ),
            Text("New Arrivals"),
            NewArrivalListView(),
            Products(productCount: ProductCount.secondThree),
            Text("New Shops"),
            NewShopsListView(),
            Products(productCount: ProductCount.rest),
          ],
        ),
      ),
    );
  }
}
