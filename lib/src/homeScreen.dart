import 'package:flutter/cupertino.dart';
import 'cuperScafoldScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            title: Text("Articles"),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid),
            title: Text("Views"),
          ),
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: (i == 0) ? Text('Articles') : Text("Views"),
              ),
              child: Center(
                child: CupertinoButton(
                  child: Text(
                    "This tab is #$i",
                    style: CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(fontSize: 32),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) {
                        return CuperScaffoldScreen(
                            i == 0 ? 'Articles' : 'Views');
                      }),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
