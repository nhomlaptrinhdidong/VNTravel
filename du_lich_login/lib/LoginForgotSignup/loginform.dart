import 'dart:convert';

import 'package:flutter/material.dart';

import '../api.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool passSecurity = true;
  // ignore: non_constant_identifier_names
  final TextEditingController _ten_dang_nhap = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _mat_khau = TextEditingController();
  Iterable s = [];
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
                padding: const EdgeInsets.fromLTRB(0, 200, 0, 20),
                child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset('images/logo.png')),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
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
                        controller: _ten_dang_nhap,
                        decoration: const InputDecoration(
                            labelText: "USERNAME",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 13)),
                      ),
                    ),
                    TextField(
                      controller: _mat_khau,
                      decoration: InputDecoration(
                        labelText: "PASSWORD",
                        labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 13),
                        suffixIcon: IconButton(
                          icon: passSecurity
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.security),
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
                    child: const Text(
                      'LOG IN',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      API(url: "http://10.0.2.2/travel/api/login.php?ten_dang_nhap='${_ten_dang_nhap.text}'&mat_khau='${_mat_khau.text}'")
                          .getDataString()
                          .then((value) {
                        s = json.decode(value);
                        setState(() {
                          if (s.elementAt(0)["kq"].toString() == "true") {
                            Navigator.pushNamed(context, '/maintask');
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext builder) {
                                  return AlertDialog(
                                    title: Row(children: const [
                                      Text("Vui lòng kiểm tra lại!"),
                                    ]),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Đóng'))
                                    ],
                                  );
                                });
                          }
                        });
                      });
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
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signupform');
                        },
                        child: const Text('SIGN UP?')),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgotform');
                        },
                        child: const Text('FORGOT PASSWORD')),
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
