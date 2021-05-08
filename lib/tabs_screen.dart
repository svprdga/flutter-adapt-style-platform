import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adapt_style_platform/styles.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _index = 0;

  final _items = [
    BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tab A'),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded), label: 'Tab B'),
  ];

  @override
  Widget build(BuildContext context) {
    if (isMaterial(context)) {
      return _getMaterialWidget();
    } else {
      return _getCupertinoWidget(context);
    }
  }

  Widget _getMaterialWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Screen'),
        brightness: materialBarData.brightness,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: _getCurrentTab(_index),
    );
  }

  Widget _getCupertinoWidget(BuildContext mainContext) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
        items: _items,
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) => CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: cupertinoBarData.backgroundColor,
              brightness: cupertinoBarData.brightness,
              leading: CupertinoNavigationBarBackButton(
                onPressed: () => Navigator.of(mainContext).pop(),
              ),
              middle: Text(
                'Tabs Screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
            child: _getCurrentTab(index),
          ),
        );
      },
    );
  }

  Widget _getCurrentTab(int index) {
    return Center(
      child: Text('Tab ${index == 0 ? 'A' : 'B'}'),
    );
  }
}
