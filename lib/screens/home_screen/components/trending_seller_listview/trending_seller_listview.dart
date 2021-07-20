import 'package:flutter/material.dart';
import 'package:mockfeveret/bloc/trending_seller_bloc.dart';
import 'package:mockfeveret/models/trending_seller_model.dart';

import 'local_widgets/trending_seller_card.dart';

class TrendingSellerListView extends StatefulWidget {
  const TrendingSellerListView({
    Key key,
  }) : super(key: key);

  @override
  _TrendingSellerListViewState createState() => _TrendingSellerListViewState();
}

class _TrendingSellerListViewState extends State<TrendingSellerListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: StreamBuilder<List<TrendingSellerModel>>(
        stream: trendingSellerBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TrendingSellerModel> sellers = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sellers.length,
                itemBuilder: (context, index) {
                  return TrendingSellersCard(
                    sellerProfilePhoto: sellers[index].sellerProfilePhoto,
                    sellerItemPhoto: sellers[index].sellerItemPhoto,
                    sellerName: sellers[index].sellerName,
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
    trendingSellerBloc.getTrendingSellers();
  }
}
