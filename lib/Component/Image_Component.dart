import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageComponent extends StatelessWidget {
  final String image;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  const ImageComponent(
      {super.key, required this.image, this.boxFit, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(image),
      fit: boxFit,
      height: height,
      width: width,
    );
  }
}
