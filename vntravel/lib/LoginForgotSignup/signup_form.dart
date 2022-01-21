import 'package:du_lich_login/LoginForgotSignup/loginform.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          color: Colors.pink[50],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset('images/logo.png')),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                height: 370,
                decoration: BoxDecoration(
                  color: const Color(0xff7209b7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: const [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                        child: Text(
                          'Register Account',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "USERNAME",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 13)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "PASSWORD",
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "EMAIL",
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "PHONE NUMBER",
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xff7209b7),
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
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginForm()),
                          );
                        },
                        child: const Text('LOGIN')),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
