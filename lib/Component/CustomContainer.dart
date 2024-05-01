import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomContainer extends StatelessWidget {
  final Color color;
  final Widget? widget;
  final double? radius;
  const CustomContainer(
      {super.key, required this.color, this.widget, this.radius});

  @override
  Widget build(BuildContext context) {
    final affectiveRadius = radius ?? 0;
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(affectiveRadius),
      ),
      child: widget,
    );
  }
}
