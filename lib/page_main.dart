import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("HR App"),
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Bhanu Prasad M"),
              accountEmail: new Text("mbhanuprsd@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: defaultTargetPlatform == TargetPlatform.iOS
                    ? Colors.deepPurple
                    : Colors.white,
                child: new Text("BPM"),
              ),
            ),
            new ListTile(
              title: new Text("Questions"),
              trailing: new Icon(Icons.local_hospital),
              onTap: () => Navigator.of(context).pushNamed("/health"),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Work Questions"),
              trailing: new Icon(Icons.work),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Leaves"),
              trailing: new Icon(Icons.event_available),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new Container(
        child: Center(
          child: new Text("HR App"),
        ),
      ),
    );
  }
}
