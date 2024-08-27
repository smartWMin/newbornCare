import 'package:flutter/material.dart';
import 'package:newbornCare/components/CustomText.dart';
import 'package:newbornCare/utils/JsonUtils.dart';

class BabyCareType extends StatelessWidget {
  const BabyCareType({super.key});




  @override
  Widget build(BuildContext context) {

    final children = <Widget>[];
    JsonUtils.loadJsonFromAssets('metadata/behavior.json').then((value) {
      for (var element in value) {
        children.add(Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage('images/tom.png')
                , width: 40, height: 40),
            CustomText(text: element['behaviorName'], fontSize: 15),
          ],
        ));
      }
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      )
    );
  }
  
}