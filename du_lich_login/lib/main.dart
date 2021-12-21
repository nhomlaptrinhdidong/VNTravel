import 'package:du_lich_login/Detail-Post.dart';
import 'package:du_lich_login/TaskBar/main_taskbar.dart';
import 'package:flutter/material.dart';
import 'Login-Forgot-Sginup/LoginForm.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: LoginForm(),
    );
  }
}
