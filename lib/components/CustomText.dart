
import 'package:flutter/material.dart';

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
        color: Colors.black,
        decoration: TextDecoration.none,
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
      ),
      textDirection: defaultTextDirection,
    );
  }

}