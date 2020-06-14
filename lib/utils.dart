import 'package:firebase_auth/firebase_auth.dart';

class Utils {
  static Future<bool> isLoggedIn() async {
    return (await FirebaseAuth.instance.currentUser() != null);
  }
}
