import 'dart:convert';

import 'package:du_lich_login/TaskBar/News/listbaiviet.dart';
import 'package:du_lich_login/TaskBar/Setting/setting.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';

import '../../api.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  String ten;
  ProfileScreen({Key? key, required this.ten}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = "";
  Iterable chitiettaikhoan = [];
  Iterable listbaiviet = [];

  Future<void> getSession() async {
    username = await FlutterSession().get("myData");
    await API(
            url:
                "http://10.0.2.2/travel/api/chitiettaikhoan.php?ten_dang_nhap='${widget.ten}'")
        .getDataString()
        .then((value) {
      chitiettaikhoan = json.decode(value);
    });
    await API(
            url:
                "http://10.0.2.2/travel/api/listbaivietcanhan.php?nguoi_dung_id='${widget.ten}'")
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
        body: chitiettaikhoan.isNotEmpty
            ? ListView(
                children: [
                  Column(children: [
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
                            "http://10.0.2.2/travel/img/${chitiettaikhoan.elementAt(0)["avt"].toString()}",
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
                                backgroundImage:
                                    AssetImage("images/user/avt.jpg"),
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
                    Text(
                      chitiettaikhoan.elementAt(0)["ho_ten"].toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontStyle: FontStyle.normal),
                    ),
                    const Text(
                      'Độc Thân Vui Tính !',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    widget.ten != username
                        ? const SizedBox(
                            height: 5,
                          )
                        : OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingScreen()));
                            },
                            child: Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Container(
                                    height: 40,
                                    width: 300,
                                    color: Colors.grey,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Icon(Icons.mode_rounded),
                                        Text(
                                          'Chỉnh Sửa Trang Cá Nhân',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(13)),
                                  child: Container(
                                    height: 40,
                                    width: 50,
                                    color: Colors.grey,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Icon(Icons.more_horiz_rounded),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    widget.ten == username
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
                                  chitiettaikhoan
                                      .elementAt(0)["email"]
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          )
                        // ignore: unrelated_type_equality_checks
                        : (chitiettaikhoan
                                    .elementAt(0)["trang_thai_email"]
                                    .toString() ==
                                "0"
                            ? ListTile(
                                leading: const Icon(
                                  Icons.email_outlined,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  chitiettaikhoan
                                      .elementAt(0)["email"]
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              )
                            : const SizedBox()),
                    const SizedBox(
                      height: 5,
                    ),
                    widget.ten == username
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
                                  chitiettaikhoan
                                      .elementAt(0)["sdt"]
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          )
                        // ignore: unrelated_type_equality_checks
                        : chitiettaikhoan
                                    .elementAt(0)["trang_thai_sdt"]
                                    .toString() ==
                                "0"
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
                                      chitiettaikhoan
                                          .elementAt(0)["sdt"]
                                          .toString(),
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
                    ListBaiViet(listbaiviet: listbaiviet)
                  ]),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}

Container newPost(String description, username, imagesAvt, images) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'images/$imagesAvt',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                          child: Text(
                            username,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Text('1 giờ trước'),
                          ),
                          Icon(Icons.group_sharp, size: 18)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 6),
          child: Row(
            children: const [],
          ),
        ),
        Image.asset('images/$images', width: 450, fit: BoxFit.cover),
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          padding: const EdgeInsets.fromLTRB(20, 30, 12, 12),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.thumb_up,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.favorite,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3),
                      child: Text('1.232'),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text('645 bình luận • 490 lượt chia sẻ'),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 12),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up, color: Colors.blue),
                    ),
                    const Text('Like')
                  ],
                ),
                flex: 2,
              ),
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.messenger_outline),
                    ),
                    const Text('Comment')
                  ],
                ),
                flex: 2,
              ),
              Expanded(
                child: Row(
                  children: const [Text('Share')],
                ),
                flex: 1,
              )
            ],
          ),
        )
      ],
    ),
  );
}
