import 'package:flutter/material.dart';

class BabyCareTypeInfo {
    const BabyCareTypeInfo({required this.behaviorName, required this.index, required this.assertImagePath});

    final String behaviorName;
    final int index;
    final String assertImagePath;

    Widget getCustomWidget() {
        switch(index) {
          // 哺乳
          case 0:
            return Text(behaviorName, style: const TextStyle(fontSize: 20, color: Colors.black));
          case 1:
            return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '类型',
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '分量',
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '时间',
                    ),
                  )
                ]
            );
          case 2:
            return Text(behaviorName, style: const TextStyle(fontSize: 20, color: Colors.black));
            default:
              return Text(behaviorName, style: const TextStyle(fontSize: 20, color: Colors.black));
        }
    }

}