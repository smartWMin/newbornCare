
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 + 200.0,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        textDirection : TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget> [
          // 左侧菜单按钮
          const Icon(
            Icons.menu,
            size: 30,
            textDirection: TextDirection.ltr,
          ),
          // 新生儿信息
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '小满',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '1月23天',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // 新生儿照片信息
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(20),
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