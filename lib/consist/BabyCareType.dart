import 'package:flutter/material.dart';
import 'package:newbornCare/components/SimpleImageButton.dart';
import 'package:newbornCare/utils/JsonUtils.dart';

class BabyCareType extends StatefulWidget {
  const BabyCareType({super.key});

  @override
  State<StatefulWidget> createState() => _BabyCareTypeState();
}

class _BabyCareTypeState extends State<BabyCareType> {
  // 默认初始
  List<Widget> _listEntry = <Widget>[];

  @override
  initState() {
    super.initState();
    _loadWidgets();
  }

  Future<void> _loadWidgets() async {
    JsonUtils.loadJsonFromAssets('metadata/behavior.json').then((value) {
      final List<Widget> listEntry = <Widget>[];
      for (var element in value) {
        listEntry.add(
          SimpleImageButton(
              normalImage: element['assertImagePath'],
              pressedImage: 'images/wife.png',
              title: element['behaviorName'],
              onPressed: () {
                print(element['behaviorName']);
              },
              width: 40)
        );
      }
      setState(() {
        _listEntry = listEntry;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemCount: _listEntry.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 60,
              width: 70,
              child: _listEntry[index],
            );
          },
        ));
  }
}
