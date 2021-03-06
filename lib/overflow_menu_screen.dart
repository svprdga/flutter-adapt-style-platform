import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adapt_style_platform/styles.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

enum Overflow { OPTION_A, OPTION_B }

class OverflowMenuScreen extends StatefulWidget {
  OverflowMenuScreen({Key? key}) : super(key: key);

  @override
  _OverflowMenuScreenState createState() => _OverflowMenuScreenState();
}

class _OverflowMenuScreenState extends State<OverflowMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(
          'Overflow menu',
          style: TextStyle(color: Colors.white),
        ),
        material: (_, __) => _getMaterialBar(),
        cupertino: (_, __) => _getCupertinoBar(),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(36.0),
          child: Text(
            'Click on the overflow button in the top bar, '
            'its style will adapt to the platform.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  MaterialAppBarData _getMaterialBar() {
    return MaterialAppBarData(actions: [
      PopupMenuButton<Overflow>(
        itemBuilder: (BuildContext context) {
          return {Overflow.OPTION_A, Overflow.OPTION_B}.map((Overflow option) {
            var text = '';
            switch (option) {
              case Overflow.OPTION_A:
                text = 'Option A';
                break;
              case Overflow.OPTION_B:
                text = 'Option B';
                break;
            }
            return PopupMenuItem<Overflow>(value: option, child: Text(text));
          }).toList();
        },
        onSelected: (Overflow option) {
          // Perform action.
        },
      )
    ], brightness: materialBarData.brightness);
  }

  CupertinoNavigationBarData _getCupertinoBar() {
    return CupertinoNavigationBarData(
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.ellipsis, color: Colors.white),
          onPressed: () => showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                    actions: [
                      CupertinoActionSheetAction(
                        child: Text('Option A'),
                        onPressed: () {
                          // Perform action.
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: Text('Option B'),
                        onPressed: () {
                          // Perform action.
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )),
        ),
        backgroundColor: cupertinoBarData.backgroundColor,
        brightness: cupertinoBarData.brightness);
  }
}
