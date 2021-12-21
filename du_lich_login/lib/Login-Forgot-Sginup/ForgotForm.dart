import 'package:du_lich_login/Login-Forgot-Sginup/SignupForm.dart';
import 'package:du_lich_login/Login-Forgot-Sginup/loginform.dart';
import 'package:flutter/material.dart';
import '../TaskBar/Home/home.dart';

class Forgotform extends StatefulWidget {
  const Forgotform({ Key? key }) : super(key: key);

  @override
  _ForgotformState createState() => _ForgotformState();
}

class _ForgotformState extends State<Forgotform> {
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
             padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
             height: 150,
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
                       labelText: "Enter Email Address",
                       labelStyle: TextStyle(color: Colors.white, fontSize: 13)
                     ),
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text("Don't have an account? ", style: TextStyle(color: Colors.grey, fontSize: 11),),
                     Text("Register Now? ", style: TextStyle(color: Colors.white, fontSize: 11), ),
                   ],
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
                 child: const Text('FORGOT', style: TextStyle(color: Colors.white),),
                 onPressed: () {
                   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
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
             padding: EdgeInsets.fromLTRB(10, 100, 10, 30),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 TextButton(onPressed: () {
                   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupForm()),
                          );
                 }, child: Text('SIGN UP')),
                 TextButton(onPressed: () {
                   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginForm()),
                          );
                 }, child: Text('LOGIN')),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}