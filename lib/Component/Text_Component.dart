import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const TextComponent({super.key, required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
