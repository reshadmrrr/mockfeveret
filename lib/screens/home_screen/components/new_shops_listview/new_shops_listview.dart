import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mockfeveret/bloc/new_shop_bloc.dart';
import 'package:mockfeveret/models/new_shop_model.dart';

class NewShopsListView extends StatefulWidget {
  const NewShopsListView({
    Key key,
  }) : super(key: key);

  @override
  _NewShopsListViewState createState() => _NewShopsListViewState();
}

class _NewShopsListViewState extends State<NewShopsListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: StreamBuilder<List<NewShopModel>>(
        stream: newShopBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewShopModel> arrivals = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: arrivals.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80.0,
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: arrivals[index].sellerProfilePhoto,
                          height: 100.0,
                        ),
                        Text(
                          arrivals[index].sellerName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
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
    newShopBloc.getNewShops();
  }
}
