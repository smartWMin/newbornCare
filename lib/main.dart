import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NewBornCare());
}

class NewBornCare extends StatelessWidget {
  const NewBornCare({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NavigationWidget(),
    );
  }
}

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();

}

class _NavigationWidgetState extends State<NavigationWidget>{
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blueAccent,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.access_time),
              icon: Icon(Icons.home_outlined),
              label: '喂奶',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.add_task),
            label: '计划',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.account_circle),
            label: '个人中心',
          ),
        ]
      ),
      body: <Widget> [
        // 喂奶页面
        const FeedRecord(),
        // 计划页面
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.amber[600],
          width: 48.0,
          height: 48.0,
        ),
        // 个人中心页面
        Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.amber[600],
          width: 48.0,
          height: 48.0,
        ),
      ][currentPageIndex],
    );
  }
}


class FeedRecord extends StatefulWidget {
  const FeedRecord({super.key});

  @override
  State<StatefulWidget> createState() => _FeedRecordState();

}

class _FeedRecordState extends State<FeedRecord>{

  bool visible = false;

  final _feedRecords = [];
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  TextDirection textDirection = TextDirection.ltr;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  bool use24HourTime = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          // 新增喂奶记录按钮
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            // onPressed: () async {
            //   final TimeOfDay? time = await showTimePicker(
            //       context: context,
            //       initialTime: TimeOfDay.now(),
            //       initialEntryMode: entryMode,
            //       orientation: orientation,
            //       builder: (BuildContext context, Widget? child) {
            //         return Theme(
            //           data: Theme.of(context).copyWith(
            //             materialTapTargetSize: tapTargetSize,
            //           ),
            //           child: Directionality(
            //             textDirection: textDirection,
            //             child: MediaQuery(
            //               data: MediaQuery.of(context).copyWith(
            //                 alwaysUse24HourFormat: use24HourTime,
            //               ),
            //               child: child!,
            //             ),
            //           ),
            //         );
            //       }
            //   );
            //   setState(() {
            //     if (time != null) {
            //       _feedRecords.add('${time!.hour}:${time!.minute}');
            //     }
            //   });
            // },

            label: const Text('新增喂奶记录'),
            icon: const Icon(Icons.add),
          ),

          // 喂奶记录填写栏
          Offstage(
            offstage: visible,
            child: const TextField(
              decoration: InputDecoration(
                hintText: '请输入喂奶时间',
              ),
            ),
          ),
          // 今日喂奶记录列表
          Expanded(
            child: ListView.builder(
                itemCount: _feedRecords.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(_feedRecords[index]));
                }),
          ),
        ],
      ),
    );
  }

}



