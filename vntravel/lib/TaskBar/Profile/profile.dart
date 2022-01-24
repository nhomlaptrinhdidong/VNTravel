import 'dart:convert';

import 'package:du_lich_login/TaskBar/News/listbaiviet.dart';
import 'package:du_lich_login/TaskBar/Setting/setting.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';
import '../../api.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  Map<String, dynamic> taiKhoan;
  ProfileScreen({Key? key, required this.taiKhoan}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Iterable listbaiviet = [];
  String username = "";
  Future<void> getSession() async {
    username = await FlutterSession().get("myData");
    await API(
            url:
                "http://10.0.2.2/travel/api/listbaivietcanhan.php?nguoi_dung_id='${widget.taiKhoan['ten_dang_nhap']}'")
        .getDataString()
        .then((value) {
      listbaiviet = json.decode(value);
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getSession();
  }

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
        body: widget.taiKhoan.isNotEmpty
            ? ListView(children: [
                Stack(
                  children: <Widget>[
                    Container(
                      height: 285,
                      width: 500,
                      color: Colors.white10,
                    ),
                    SizedBox(
                      height: 200,
                      width: 500,
                      child: Image.network(
                        "http://10.0.2.2/travel/img/${widget.taiKhoan["avt"].toString()}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 150,
                        left: 420,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(300)),
                          child: Container(
                            height: 30,
                            width: 50,
                            color: Colors.white,
                            child: const Icon(Icons.camera_alt),
                          ),
                        )),
                    const Positioned(
                        top: 100,
                        left: 20,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 75,
                            backgroundImage: AssetImage("images/user/avt.jpg"),
                          ),
                        )),
                    Positioned(
                        top: 210,
                        left: 133,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.grey[500],
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      widget.taiKhoan["ho_ten"].toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontStyle: FontStyle.normal),
                    ),
                    const Text(
                      '(Bill)',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                widget.taiKhoan["ten_dang_nhap"] != username
                    ? const SizedBox(
                        height: 5,
                      )
                    : OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingScreen()));
                        },
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Container(
                                height: 40,
                                width: 300,
                                color: Colors.grey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.mode_rounded),
                                    Text(
                                      'Chỉnh Sửa Trang Cá Nhân',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(13)),
                              child: Container(
                                height: 40,
                                width: 50,
                                color: Colors.grey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.more_horiz_rounded),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 5),
                widget.taiKhoan["ten_dang_nhap"] == username
                    ? Column(
                        children: [
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.email_outlined,
                              size: 40,
                              color: Colors.black,
                            ),
                            title: Text(
                              widget.taiKhoan["email"].toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    // ignore: unrelated_type_equality_checks
                    : (widget.taiKhoan["trang_thai_email"].toString() == "0"
                        ? ListTile(
                            leading: const Icon(
                              Icons.email_outlined,
                              size: 40,
                              color: Colors.black,
                            ),
                            title: Text(
                              widget.taiKhoan["email"].toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          )
                        : const SizedBox()),
                const SizedBox(
                  height: 5,
                ),
                widget.taiKhoan["ten_dang_nhap"] == username
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.phone,
                              size: 40,
                              color: Colors.black,
                            ),
                            title: Text(
                              widget.taiKhoan["sdt"].toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    // ignore: unrelated_type_equality_checks
                    : widget.taiKhoan["trang_thai_sdt"].toString() == "0"
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.phone,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  widget.taiKhoan["sdt"].toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                listbaiviet.isNotEmpty
                    ? ListBaiViet(listbaiviet: listbaiviet)
                    : const Center(child: Text("Danh sách bài viết trống"))
              ])
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
