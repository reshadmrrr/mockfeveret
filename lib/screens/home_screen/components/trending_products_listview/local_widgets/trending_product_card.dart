import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrendingProductsCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final String shortDetails;

  const TrendingProductsCard(
      {Key key, this.productImage, this.productName, this.shortDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 8.0,
      ),
      child: Column(
        children: [
          Container(
            height: 100.0,
            width: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  productImage,
                  errorListener: () => Text('Image loading error...'),
                ),
                fit: BoxFit.cover,
              ),
              // borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Text(
            productName,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            shortDetails,
            textAlign: TextAlign.center,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
