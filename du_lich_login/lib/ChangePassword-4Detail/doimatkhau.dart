import 'package:flutter/material.dart';
import 'package:qua_tet/chitietnoiluutru.dart';
import 'chitietmon.dart';
import 'chitietquan.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({ Key? key }) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  
  bool passSecurity = true;

  Widget build(BuildContext context) {
  return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        color: Colors.pink[50],
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 20),
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset('images/logo.png')
                ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Change Password',
                 style: TextStyle(
                   fontSize: 30,
                    color: const Color(0xff7209b7)
                    ),
                  ),
              ),
            ),
           Container(
             padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
             height: 260,
             decoration: BoxDecoration(
                color: const Color(0xff7209b7),
                borderRadius: BorderRadius.circular(10.0),
             ),
             child: Column(
               children: [
                //  Padding(
                //    padding: const EdgeInsets.only(bottom: 20),
                //    child: TextField(
                //      decoration: InputDecoration(
                //        labelText: "EMAIL",
                //        labelStyle: TextStyle(color: Colors.white, fontSize: 13)
                //      ),
                //    ),
                //  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "NOW PASSWORD",
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "NEW PASSWORD",
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
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "CONFIRM PASSWORD",
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
                 child: const Text('CONTINUE', style: TextStyle(color: Colors.white),),
                 onPressed: () {
                   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailDish()),
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
                  //  Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => SignupForm()),
                  //         );
                 }, child: Text('SGIN UP?')),
                TextButton(onPressed: () {
                  //  Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => Forgotform()),
                  //         );
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