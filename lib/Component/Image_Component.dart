import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageComponent extends StatelessWidget {
  final String image;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final Color? imageColor;
  const ImageComponent(
      {super.key,
      required this.image,
      this.boxFit,
      this.height,
      this.width,
      this.imageColor});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        image,
      ),
      fit: boxFit,
      height: height,
      width: width,
      color: imageColor,
    );
  }
}
