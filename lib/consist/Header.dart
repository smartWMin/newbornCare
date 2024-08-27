

import 'package:flutter/material.dart';
import 'package:newbornCare/components/CustomText.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height > 0? height : 100,
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget> [
          // 左侧菜单按
          const Icon(
            Icons.menu,
            size: 35,
          ),
          // 新生儿信息
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(text: "柳小满", fontSize: 18, isBold: true),
              CustomText(text: "1月23天", fontSize: 13)
            ],
          ),
          // 新生儿照片信息
          Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('images/tom.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                width: 3,
                color: Colors.lightGreenAccent
              ),
              borderRadius: BorderRadius.circular(13),
            ),
          )
        ],
      ),
    );
  }

}