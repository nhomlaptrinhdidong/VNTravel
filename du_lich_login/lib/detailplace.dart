import 'dart:ffi';

import 'package:flutter/material.dart';
String placeName_Text = "Tây Bắc";
String description_Text = "Vùng núi Tây Bắc được biết đến là một vùng lãnh thổ nhỏ hẹp ở phía Tây Bắc nước ta với địa hình toàn đồi núi và có nhiều hạn chế trong việc phát triển kinh tế. Tuy nhiên, trên thực tế, với đặc điểm về điều kiện tự nhiên – dân cư xã hội của mình, vùng núi Tây Bắc cũng có nhiều điều kiện để phát triển kinh tế riêng.";
String slogan_Text = "Phận nam nhi, Không đi? Đời không nể!!!";
double pointOfPlace = 9.7;

class DetaiPlace extends StatefulWidget {
  const DetaiPlace({ Key? key }) : super(key: key);

  @override
  _DetaiPlaceState createState() => _DetaiPlaceState();
}

class _DetaiPlaceState extends State<DetaiPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            //Ảnh địa danh
            Image.asset('images/detail/taybac.jpg', fit: BoxFit.cover,),
            //Tên địa danh
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(placeName_Text, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),),
                )
              ],
            ),
            //Mô tả
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(description_Text, textAlign: TextAlign.justify),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          // Text('Đáng giá của tổng quan: ',
                          // style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text('Điểm: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                                  Text(pointOfPlace.toString(), style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300))
                                ],
                              ),
                              Icon(Icons.star, color: Colors.red, size: 50,),
                              Icon(Icons.star, color: Colors.red, size: 50,),
                              Icon(Icons.star, color: Colors.red, size: 50,),
                              Icon(Icons.star, color: Colors.red, size: 50,),
                              Icon(Icons.star, color: Colors.red, size: 50,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(slogan_Text,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}