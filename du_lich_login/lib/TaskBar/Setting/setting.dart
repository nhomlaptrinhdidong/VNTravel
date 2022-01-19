import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('VNTravel'),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.messenger_outline_rounded),
            )
          ],
        ),
        body: ListView(
          children: [
            const Text(
              'Chỉnh Sửa Trang Cá Nhân',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
                leading: const Icon(
                  Icons.shield_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'lethanhquy.0878@gmail.com',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Số Địa Thoại',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
                leading: const Icon(
                  Icons.phone_android,
                  size: 30,
                  color: Colors.black,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          labelText: 'SĐT',
                          hintText: '03979223114',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )
                  ],
                )),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Họ Và Tên',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
                leading: const Icon(
                  Icons.phone_android,
                  size: 30,
                  color: Colors.black,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          labelText: 'Họ Và Tên',
                          hintText: 'Thanh Quý',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )
                  ],
                )),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Ngày Sinh',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
                leading: const Icon(
                  Icons.phone_android,
                  size: 30,
                  color: Colors.black,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          labelText: 'Ngày Sinh',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )
                  ],
                )),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Địa Chỉ ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
                leading: const Icon(
                  Icons.phone_android,
                  size: 30,
                  color: Colors.black,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 20),
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
