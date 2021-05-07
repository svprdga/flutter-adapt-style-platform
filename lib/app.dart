import 'package:flutter/widgets.dart';
import 'package:flutter_adapt_style_platform/overflow_menu.dart';
import 'package:flutter_adapt_style_platform/simple_screen.dart';
import 'package:flutter_adapt_style_platform/tabs_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
        builder: (BuildContext context) => PlatformApp(
          title: 'Flutter platform style sample',
          home: TabsScreen()
        )
    );
  }
}