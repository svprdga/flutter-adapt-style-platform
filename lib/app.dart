import 'package:flutter/widgets.dart';
import 'package:flutter_adapt_style_platform/selector_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      initialPlatform: TargetPlatform.iOS,
        builder: (BuildContext context) => PlatformApp(
          title: 'Flutter platform style sample',
          home: SelectorScreen()
        )
    );
  }
}