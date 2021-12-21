import 'package:flutter/material.dart';

class ChinhSua extends StatefulWidget {
  const ChinhSua({Key? key}) : super(key: key);

  @override
  _ChinhSuaState createState() => _ChinhSuaState();
}

class _ChinhSuaState extends State<ChinhSua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Text(
          'Chỉnh Sửa Trang Cá Nhân',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Email',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
            leading: Icon(
              Icons.shield_outlined,
              size: 30,
              color: Colors.black,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'lethanhquy.0878@gmail.com',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                )
              ],
            )),
        SizedBox(
          height: 15,
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Số Địa Thoại',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
            leading: Icon(
              Icons.phone_android,
              size: 30,
              color: Colors.black,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'SĐT',
                      hintText: '03979223114',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                )
              ],
            )),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Họ Và Tên',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
            leading: Icon(
              Icons.phone_android,
              size: 30,
              color: Colors.black,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Họ Và Tên',
                      hintText: 'Thanh Quý',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                )
              ],
            )),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ngày Sinh',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
            leading: Icon(
              Icons.phone_android,
              size: 30,
              color: Colors.black,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Ngày Sinh',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                )
              ],
            )),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Địa Chỉ ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
            leading: Icon(
              Icons.phone_android,
              size: 30,
              color: Colors.black,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Địa Chỉ ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                )
              ],
            )),
      ],
    ));
  }
}
