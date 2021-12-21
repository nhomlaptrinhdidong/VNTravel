import 'package:du_lich_login/Login-Forgot-Sginup/ForgotForm.dart';
import 'package:du_lich_login/TaskBar/main_taskbar.dart';
import 'package:flutter/material.dart';
import '../TaskBar/Home/home.dart';
import 'SignupForm.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool passSecurity = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        color: Colors.pink[50],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 0, 20),
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset('images/logo.png')
                ),
            ),
           Container(
             padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
             height: 180,
             decoration: BoxDecoration(
                color: const Color(0xff7209b7),
                borderRadius: BorderRadius.circular(10.0),
             ),
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: TextField(
                     decoration: InputDecoration(
                       labelText: "USERNAME",
                       labelStyle: TextStyle(color: Colors.white, fontSize: 13)
                     ),
                   ),
                 ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "PASSWORD",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 13),
                      suffixIcon: IconButton(
                        icon: passSecurity ? Icon(Icons.remove_red_eye) : Icon(Icons.security),
                        onPressed: () {
                          setState(() {
                            passSecurity = !passSecurity;
                          });
                        },
                      ),
                    ),
                    obscureText: passSecurity,
                  )
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
             child: SizedBox(
               width: double.infinity,
               height: 50,
               child: OutlinedButton(
                 child: const Text('LOG IN', style: TextStyle(color: Colors.white),),
                 onPressed: () {
                   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainTask()),
                          );
                 },
                 style: OutlinedButton.styleFrom(
                 backgroundColor: Color(0xff7209b7),
                 shape: const RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(
                 Radius.circular(25),
                   ),
                  ),
                 ),
               ),
             ),
           ),
           Container(
             padding: EdgeInsets.fromLTRB(10, 70, 10, 30),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 TextButton(onPressed: () {
                   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupForm()),
                          );
                 }, child: Text('SGIN UP?')),
                TextButton(onPressed: () {
                   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Forgotform()),
                          );
                 }, child: Text('FORGOT PASSWORD')),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}