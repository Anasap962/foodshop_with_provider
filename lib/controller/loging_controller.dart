import 'package:flutter/material.dart';
import 'package:flutter_application_11/main.dart';
import 'package:flutter_application_11/view/navigator_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageProvider extends  ChangeNotifier{
    final TextEditingController usenamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final name = '123';
  final pass = '123';
  final formkey = GlobalKey<FormState>();

  
    Future<void> checkLogin(BuildContext context) async {
    final _username = usenamecontroller.text;
    final _password = passwordcontroller.text;
    if (_username == name && _password == pass) {
      final _sharedPrfs = await SharedPreferences.getInstance();
      await _sharedPrfs.setBool(SAVE_KEY, true);
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return  NavigatorHome();
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          'The password you entered is Invalid',
          style: TextStyle(color: Colors.red),
        ),
      ));
    }
    notifyListeners();
  }

  
}