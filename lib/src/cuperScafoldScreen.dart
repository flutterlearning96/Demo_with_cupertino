import 'package:flutter/cupertino.dart';

class CuperScaffoldScreen extends StatefulWidget {
  const CuperScaffoldScreen(this.topic);
  final String topic;
  @override
  CuperScaffoldScreenState createState() {
    return new CuperScaffoldScreenState();
  }
}

class CuperScaffoldScreenState extends State<CuperScaffoldScreen> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Details'),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('A switch'),
                  ),
                  CupertinoSwitch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() => switchValue = value);
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: CupertinoButton(
                        child: Text("launch action sheet"),
                        onPressed: () {
                          showCupertinoModalPopup<int>(
                            context: context,
                            builder: (context) {
                              return CupertinoActionSheet(
                                title: Text('some choices'),
                                actions: [
                                  CupertinoActionSheetAction(
                                    child: Text('option one !'),
                                    onPressed: () {
                                      Navigator.pop(context, 1);
                                    },
                                    isDefaultAction: true,
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text('option two !'),
                                    onPressed: () {
                                      Navigator.pop(context, 2);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text('option three !'),
                                    onPressed: () {
                                      Navigator.pop(context, 3);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
