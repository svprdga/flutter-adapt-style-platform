import 'package:flutter/material.dart';
import 'package:flutter_adapt_style_platform/overflow_menu_screen.dart';
import 'package:flutter_adapt_style_platform/simple_screen.dart';
import 'package:flutter_adapt_style_platform/styles.dart';
import 'package:flutter_adapt_style_platform/tabs_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SelectorScreen extends StatefulWidget {
  SelectorScreen({Key? key}) : super(key: key);

  @override
  _SelectorScreenState createState() => _SelectorScreenState();
}

class _SelectorScreenState extends State<SelectorScreen> {

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Selector Screen', style: TextStyle(color: Colors.white),),
        cupertino: (_,__) => CupertinoNavigationBarData(
          backgroundColor: materialTheme.primaryColor
        ),
      ),
      body: Center(
        child: IntrinsicHeight(
          child: Column(
            children: [
              PlatformButton(
                child: Text('Open simple screen'),
                material: (_, __) => materialRaisedButtonData,
                cupertinoFilled: (_, __) => cupertinoFilledButtonData,
                onPressed: () => _goToScreen(SimpleScreen()),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: PlatformButton(
                  child: Text('Open overflow menu sample'),
                  material: (_, __) => materialRaisedButtonData,
                  cupertinoFilled: (_, __) => cupertinoFilledButtonData,
                  onPressed: () => _goToScreen(OverflowMenuScreen()),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: PlatformButton(
                  child: Text('Open tabs sample'),
                  material: (_, __) => materialRaisedButtonData,
                  cupertinoFilled: (_, __) => cupertinoFilledButtonData,
                  onPressed: () => _goToScreen(TabsScreen()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _goToScreen(Widget screen) {
    Navigator.push(
        context,
        platformPageRoute(
            context: context, builder: (BuildContext context) => screen));
  }
}
