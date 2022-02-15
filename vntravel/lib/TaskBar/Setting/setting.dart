import 'dart:convert';

import 'package:du_lich_login/TaskBar/Setting/thaydoimatkhau.dart';
import 'package:flutter/material.dart';

import '../../api.dart';
import '../main_taskbar.dart';

// ignore: must_be_immutable
class SettingScreen extends StatefulWidget {
  Map<String, dynamic> taiKhoan;

  SettingScreen({Key? key, required this.taiKhoan}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  int? sttemailint;
  int? sttphoneint;
  bool sttemail = true;
  bool sttphone = true;
  bool result = false;
  @override
  void initState() {
    super.initState();
    if (widget.taiKhoan['trang_thai_email'] == "0") {
      sttemail = true;
    } else {
      sttemail = false;
    }
    if (widget.taiKhoan['trang_thai_sdt'] == "0") {
      sttphone = true;
    } else {
      sttphone = false;
    }
    email.text = widget.taiKhoan['email'];
    phone.text = widget.taiKhoan['sdt'];
    name.text = widget.taiKhoan['ho_ten'];
  }

  Future<void> changeInfo() async {
    {
      await API(
              url:
                  "http://10.0.2.2/travel/api/thaydoithongtin.php?email='${email.text}'&sdt='${phone.text}'&sttsdt='$sttphoneint'&sttemail='$sttemailint'&ho_ten='${name.text}'&ten_dang_nhap='${widget.taiKhoan['ten_dang_nhap']}'")
          .getDataString()
          .then((value) {
        result = json.decode(value);
      });
      setState(() {});
    }
    if (result == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => MainTask(
                    name: widget.taiKhoan['ten_dang_nhap'],
                    index: 4,
                  )));
    } else {
      const CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Chỉnh Sửa Trang Cá Nhân',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ListTile(
              title: SizedBox(
                height: 50,
                child: TextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Họ Tên",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            Column(children: [
              const SizedBox(
                height: 12,
              ),
              SwitchListTile(
                title: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                value: sttemail,
                onChanged: (value) => setState(() {
                  sttemail = value;
                }),
              ),
              const SizedBox(
                height: 15,
              ),
            ]),
            Column(children: [
              const SizedBox(
                height: 12,
              ),
              SwitchListTile(
                title: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: phone,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "Số Điện Thoại",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                value: sttphone,
                onChanged: (value) => setState(() {
                  sttphone = value;
                }),
              ),
              const SizedBox(
                height: 15,
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (sttemail == true) {
                      sttemailint = 0;
                    } else {
                      sttemailint = 1;
                    }
                    if (sttphone == true) {
                      sttphoneint = 0;
                    } else {
                      sttphoneint = 1;
                    }
                    changeInfo();
                  },
                  child: const Text('Lưu')),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ChangePassword()));
                  },
                  child: const Text('Thay đổi mật khẩu')),
            )
          ],
        ));
  }
}
