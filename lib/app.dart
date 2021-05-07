import 'package:flutter/widgets.dart';
import 'package:flutter_adapt_style_platform/selector_screen.dart';
import 'package:flutter_adapt_style_platform/styles.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
        builder: (BuildContext context) => PlatformApp(
            title: 'Flutter platform style sample',
            material: (_, __) => MaterialAppData(theme: materialTheme),
            cupertino: (_, __) => CupertinoAppData(theme: cupertinoTheme),
            home: SelectorScreen()));
  }
}
