import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/page_login.dart';

class Utils {
  static Future<bool> isLoggedIn() async {
    return (await FirebaseAuth.instance.currentUser() != null);
  }

  static Future<FirebaseUser> getUser() async {
    return await FirebaseAuth.instance.currentUser();
  }

  static void logout(BuildContext context) {
    FirebaseAuth.instance.signOut().then((status) => {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginPage()),
              (Route<dynamic> route) => false),
        });
  }
}
