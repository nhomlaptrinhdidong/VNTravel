import 'dart:convert';
import 'package:du_lich_login/api.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';

import '../main_taskbar.dart';

// ignore: must_be_immutable
class Share extends StatefulWidget {
  Map<String, dynamic> diadanh;
  Map<String, dynamic> taiKhoan;

  Share({Key? key, required this.diadanh, required this.taiKhoan})
      : super(key: key);

  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  Iterable kq = [];
  final TextEditingController _noiDung = TextEditingController();
  Future<void> addPost() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    await API(
            url:
                "http://10.0.2.2/travel/api/thembaiviet.php?noi_dung='${_noiDung.text}'&nguoi_dung_id='${widget.taiKhoan['ten_dang_nhap']}'&dia_danh_id='${widget.diadanh['id']}'&ngay_dang='$formattedDate'")
        .getDataString()
        .then((value) {
      kq = json.decode(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Post"),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await addPost();

              if (kq.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => MainTask(
                              name: widget.taiKhoan['ten_dang_nhap'],
                              index: 1,
                            )));
              }
              setState(() {});
            },
            icon: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: const Icon(Icons.reply, color: Colors.white)),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'http://10.0.2.2/travel/img/${widget.taiKhoan["avt"]}',
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
                              widget.taiKhoan['ho_ten'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _noiDung,
              maxLines: 10,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Bạn đang nghĩ gì?"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          'http://10.0.2.2/travel/img/${widget.diadanh["hinh_anh"]}',
                          width: 130,
                          height: 110,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            width: 240,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    widget.diadanh['ten'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  widget.diadanh['mo_ta'],
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  softWrap: false,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, spreadRadius: 3),
                ],
              ),
              height: 110,
            ),
          ),
        ],
      ),
    );
  }
}
