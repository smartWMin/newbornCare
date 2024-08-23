

import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget{
  const CustomText({super.key, required this.text, required this.fontSize, this.isBold = false});

  // 字体大小
  final double fontSize;
  // 文本
  final String text;

  final TextDirection defaultTextDirection = TextDirection.ltr;

  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
      textDirection: defaultTextDirection,
    );
  }

}