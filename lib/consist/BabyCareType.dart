import 'package:flutter/material.dart';
import 'package:newbornCare/components/SimpleImageButton.dart';
import 'package:newbornCare/entity/BabyCareTypeInfo.dart';
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
        BabyCareTypeInfo babyCareTypeInfo = BabyCareTypeInfo(behaviorName: element['behaviorName'], assertImagePath: element['assertImagePath'], index: element['index']);
        listEntry.add(
          SimpleImageButton(
              normalImage: babyCareTypeInfo.assertImagePath,
              pressedImage: babyCareTypeInfo.assertImagePath,
              title: babyCareTypeInfo.behaviorName,
              onPressed: () {
                // 当按钮被点击时，显示对话框
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      icon: Column(
                        children: [
                          ClipPath.shape(
                            shape: const CircleBorder(),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset(babyCareTypeInfo.assertImagePath, fit: BoxFit.scaleDown),
                            ),
                          ),
                          Text(babyCareTypeInfo.behaviorName)
                        ],
                        ),
                      content: babyCareTypeInfo.getCustomWidget(),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('关闭'),
                          onPressed: () {
                            // 当用户点击关闭按钮时关闭对话框
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
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
