import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrendingSellersCard extends StatelessWidget {
  final String sellerProfilePhoto;
  final String sellerItemPhoto;
  final String sellerName;
  const TrendingSellersCard({
    Key key,
    this.sellerProfilePhoto,
    this.sellerItemPhoto,
    this.sellerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 8.0,
      ),
      child: Container(
        height: 100.0,
        width: 80.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              sellerItemPhoto,
              errorListener: () => Text('Image loading error...'),
            ),
            fit: BoxFit.cover,
          ),
          // borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 16,
                foregroundImage: CachedNetworkImageProvider(
                  sellerProfilePhoto,
                  errorListener: () => Text('Image loading error...'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              child: Text(
                sellerName,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
