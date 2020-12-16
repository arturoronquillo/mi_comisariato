import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerImageController extends GetxController {}

class BannerImage extends StatelessWidget {
  final String url;
  final double height;
  const BannerImage({Key key, @required this.url, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height != null ? height : null,
      width: height != null ? height : null,
      child: Card(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Image.network(
          url,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
