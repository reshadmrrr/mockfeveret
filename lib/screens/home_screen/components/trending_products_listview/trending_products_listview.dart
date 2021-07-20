import 'package:flutter/material.dart';
import 'package:mockfeveret/bloc/trending_product_bloc.dart';
import 'package:mockfeveret/models/trending_product_model.dart';
import 'package:mockfeveret/screens/home_screen/components/trending_products_listview/local_widgets/trending_product_card.dart';

class TrendingProductListView extends StatefulWidget {
  const TrendingProductListView({Key key}) : super(key: key);

  @override
  _TrendingProductListViewState createState() =>
      _TrendingProductListViewState();
}

class _TrendingProductListViewState extends State<TrendingProductListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: StreamBuilder<List<TrendingProductModel>>(
        stream: trendingProductBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TrendingProductModel> products = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return TrendingProductsCard(
                    productImage: products[index].productImage,
                    productName: products[index].productName,
                    shortDetails: products[index].shortDetails,
                  );
                });
          } else {
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    trendingProductBloc.getTrendingProducts();
  }
}
