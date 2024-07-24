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
        FeedRecord(),
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

  final _names = ['Andrew', 'Bob', 'Charles'];
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          // 新增喂奶记录按钮
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _names.add('Someone($_counter)');
                _counter ++;
              });
            },
            tooltip: '新增喂奶记录',
            child: const Icon(Icons.add),
          ),

          // 今日喂奶记录列表
          Expanded(
            child: ListView.builder(
                itemCount: _names.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(_names[index]));
                }),
          ),
        ],
      ),
    );
  }



}



