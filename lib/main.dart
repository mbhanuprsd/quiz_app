import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/page_login.dart';
import 'package:quiz_app/page_main.dart';
import 'package:quiz_app/page_questions.dart';
import 'package:quiz_app/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => new MainPage(),
        "/questions": (BuildContext context) => new QuestionsPage(),
        "/page1": (BuildContext context) => new QuestionsPage(),
        "/page2": (BuildContext context) => new QuestionsPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS
            ? Colors.grey[50]
            : null,
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => {
              Utils.isLoggedIn().then((loggedIn) => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            loggedIn ? MainPage() : LoginPage()))
                  })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: new CircularProgressIndicator(),
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
