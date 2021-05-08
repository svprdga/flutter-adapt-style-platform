import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

final materialTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity
);

final cupertinoTheme = CupertinoThemeData(
    primaryColor: CupertinoDynamicColor.withBrightness(
        color: materialTheme.primaryColor,
        darkColor: materialTheme.primaryColorDark)
);

final materialRaisedButtonData = MaterialRaisedButtonData(
    color: materialTheme.primaryColor, textColor: Colors.white);

final cupertinoFilledButtonData = CupertinoFilledButtonData(
    minSize: 50,
    padding: EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 0));