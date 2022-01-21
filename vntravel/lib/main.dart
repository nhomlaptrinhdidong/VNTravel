import 'package:du_lich_login/TaskBar/main_taskbar.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';
import 'LoginForgotSignup/loginform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

String username = "";

class _MyAppState extends State<MyApp> {
  Future<void> getSession() async {
    username = await FlutterSession().get("myData");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getSession();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: username == "" ? const LoginForm() : const MainTask());
  }
}
