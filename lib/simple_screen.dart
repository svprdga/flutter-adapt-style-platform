import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SimpleScreen extends StatefulWidget {
  SimpleScreen({Key? key}) : super(key: key);

  @override
  _SimpleScreenState createState() => _SimpleScreenState();
}

class _SimpleScreenState extends State<SimpleScreen> {
  // ****************************** LIFECYCLE ****************************** //

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Sample Screen'),
      ),
      body: Center(
        child: IntrinsicHeight(
          child: Column(
            children: [
              PlatformButton(
                child: Text('Open dialog'),
                onPressed: _showDialog,
              )
            ],
          ),
        ),
      ),
    );
  }

  // *************************** PRIVATE METHODS *************************** //

  _showDialog() {
    showPlatformDialog(
        context: context,
        builder: (BuildContext context) {
          return PlatformAlertDialog(
            content:
            Text('The style of this dialog is adapted to the platform.'),
            actions: [
              PlatformDialogAction(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }
}
