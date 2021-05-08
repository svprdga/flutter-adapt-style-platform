import 'package:flutter/cupertino.dart';
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
        title: Text(
          'Selector Screen',
          style: TextStyle(color: Colors.white),
        ),
        material: (_, __) => materialBarData,
        cupertino: (_, __) => cupertinoBarData,
      ),
      body: Center(
        child: IntrinsicHeight(
          child: Column(
            children: [
              PlatformButton(
                material: (_, __) => materialRaisedButtonData,
                cupertinoFilled: (_, __) => cupertinoFilledButtonData,
                child: IntrinsicWidth(
                  child: Row(
                    children: [
                      PlatformWidgetBuilder(
                        material: (_, child, __) => Icon(Icons.swap_horiz),
                        cupertino: (_, child, __) =>
                            Icon(CupertinoIcons.arrow_swap),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('Swap style'))
                    ],
                  ),
                ),
                onPressed: () {
                  if (isMaterial(context)) {
                    PlatformProvider.of(context)?.changeToCupertinoPlatform();
                  } else {
                    PlatformProvider.of(context)?.changeToMaterialPlatform();
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: PlatformButton(
                  child: Text('Open simple screen'),
                  material: (_, __) => materialRaisedButtonData,
                  cupertinoFilled: (_, __) => cupertinoFilledButtonData,
                  onPressed: () => _goToScreen(SimpleScreen()),
                ),
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
