import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mockfeveret/bloc/new_arrival_bloc.dart';
import 'package:mockfeveret/models/new_arrival_model.dart';

class NewArrivalListView extends StatefulWidget {
  const NewArrivalListView({
    Key key,
  }) : super(key: key);

  @override
  _NewArrivalListViewState createState() => _NewArrivalListViewState();
}

class _NewArrivalListViewState extends State<NewArrivalListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: StreamBuilder<List<NewArrivalModel>>(
        stream: arrivalBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewArrivalModel> arrivals = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: arrivals.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80.0,
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: arrivals[index].productImage,
                          height: 100.0,
                        ),
                        Text(
                          arrivals[index].productName,
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
    arrivalBloc.getNewArrivals();
  }
}
