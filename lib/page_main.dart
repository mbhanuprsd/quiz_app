import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/utils.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseUser firebaseUser;
  @override
  void initState() {
    super.initState();
    Utils.getUser().then((user) => {
          if (user.email == null)
            {Utils.logout(context)}
          else
            {firebaseUser = user}
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Quiz App"),
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("-"),
              accountEmail: new Text("-"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: defaultTargetPlatform == TargetPlatform.iOS
                    ? Colors.deepPurple
                    : Colors.white,
                child: Image.network(""),
              ),
            ),
            new ListTile(
              title: new Text("Questions"),
              trailing: new Icon(Icons.local_hospital),
              onTap: () => Navigator.of(context).pushNamed("/questions"),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Page 1"),
              trailing: new Icon(Icons.work),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Page 2"),
              trailing: new Icon(Icons.event_available),
            ),
            // new Divider(),
            // new ListTile(
            //   title: new Text("Close"),
            //   trailing: new Icon(Icons.close),
            //   onTap: () => Navigator.of(context).pop(),
            // ),
            new Divider(),
            new ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.close),
              onTap: () => Utils.logout(context),
            ),
          ],
        ),
      ),
      body: new Container(
        child: Center(
          child: new Text("Quiz App"),
        ),
      ),
    );
  }
}
