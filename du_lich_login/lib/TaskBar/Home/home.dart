import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Home/TypeOfPlaceName.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Center(
                child: Text('TOURS', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
              ),
            ),
            //Phần Type of place name
            TypeOfPlaceName()
          ],
        ),
      ),
    );
  }
}

