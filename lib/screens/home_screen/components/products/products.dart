import 'package:flutter/material.dart';
import 'package:mockfeveret/bloc/product_bloc.dart';
import 'package:mockfeveret/models/product_model.dart';

import 'local_widgets/product_card.dart';

enum ProductCount { firstThree, secondThree, rest }

class Products extends StatefulWidget {
  final ProductCount productCount;
  const Products({
    Key key,
    @required this.productCount,
  }) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductModel>>(
      stream: productBloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> stories = <ProductModel>[];
          switch (widget.productCount) {
            case ProductCount.firstThree:
              stories = snapshot.data.take(3).toList();
              break;
            case ProductCount.secondThree:
              stories = snapshot.data.skip(3).take(3).toList();
              break;
            case ProductCount.rest:
              stories = snapshot.data.skip(6).toList();
              break;
            default:
              stories = snapshot.data;
          }
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  story: stories[index].story,
                  shopName: stories[index].shopName,
                  storyImage: stories[index].storyImage,
                  salesQty: stories[index].salesQty,
                  availableStock: stories[index].availableStock,
                  orderQty: stories[index].orderQty,
                );
              });
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    productBloc.getProducts();
  }
}
