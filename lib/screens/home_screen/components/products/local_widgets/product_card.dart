import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String shopName;
  final String story;
  final String storyImage;
  final int salesQty;
  final int availableStock;
  final int orderQty;

  const ProductCard({
    Key key,
    this.shopName,
    this.story,
    this.storyImage,
    this.salesQty,
    this.availableStock,
    this.orderQty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          shopName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(story),
        CachedNetworkImage(imageUrl: storyImage),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("$salesQty Sales"),
            Text(
              "$availableStock Available Stock",
            ),
            Text("$orderQty Order(s)"),
          ],
        )
      ],
    );
  }
}
