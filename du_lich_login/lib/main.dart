import 'package:du_lich_login/TaskBar/main_taskbar.dart';
import 'package:flutter/material.dart';
import 'LoginForgotSignup/forgotform.dart';
import 'LoginForgotSignup/loginform.dart';
import 'LoginForgotSignup/signup_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginForm(),
        '/signupform': (context) => const SignupForm(),
        '/forgotform': (context) => const Forgotform(),
        '/maintask': (context) => const MainTask(),
      },
    );
  }
}
