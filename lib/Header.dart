
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborncare/components/CustomText.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  final TextDirection defaultTextDirection = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80  ,
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        textDirection : TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget> [
          // 左侧菜单按
          const Icon(
            Icons.menu,
            size: 30,
            textDirection: TextDirection.ltr,
          ),
          // 新生儿信息
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(text: "柳小满", fontSize: 15, isBold: true),
              CustomText(text: "1月23天", fontSize: 15)
            ],
          ),
          // 新生儿照片信息
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: const DecorationImage(
                image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                fit: BoxFit.scaleDown,
              ),
              border: Border.all(
                width: 2,
                color: Colors.deepPurpleAccent
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          )
        ],
      ),
    );
  }

}