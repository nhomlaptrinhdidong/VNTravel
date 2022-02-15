import 'dart:convert';

import 'package:du_lich_login/TaskBar/Home/detailplace.dart';
import 'package:du_lich_login/TaskBar/Profile/profile.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';

import '../../api.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  // ignore: use_key_in_widget_constructors
  const DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf = "";
  String secondHalf = "";

  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 40) {
      firstHalf = widget.text.substring(0, 40);
      secondHalf = widget.text.substring(40, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Column(
              children: <Widget>[Text(firstHalf)],
            )
          : Column(
              children: <Widget>[
                flag
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text((firstHalf + "...")),
                        ],
                      )
                    : Column(
                        children: [
                          Text((firstHalf + secondHalf)),
                        ],
                      ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        flag ? "show more" : "show less",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}

// ignore: must_be_immutable
class ListBaiViet extends StatefulWidget {
  Iterable listbaiviet;
  ListBaiViet({Key? key, required this.listbaiviet}) : super(key: key);

  @override
  _ListBaiVietState createState() => _ListBaiVietState();
}

class _ListBaiVietState extends State<ListBaiViet> {
  Map<String, dynamic> tuongtacbaiviet = {};
  String username = "";
  Future<void> loaddata() async {
    username = await FlutterSession().get("myData");
    await API(
            url:
                "http://10.0.2.2/travel/api/listtuongtac.php?ten_dang_nhap='$username'")
        .getDataString()
        .then((value) {
      tuongtacbaiviet = json.decode(value);
    });
    setState(() {});
  }

  Future<void> themTuongTac(
      String tuongTac, idBaiViet, idNguoiDung, loaiQuery) async {
    await API(
            url:
                "http://10.0.2.2/travel/api/tuongtac.php?query_type='$loaiQuery'&tuong_tac='$tuongTac'&id_bai_viet='$idBaiViet'&id_nguoi_dung='$idNguoiDung'")
        .getDataString();
  }

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    return tuongtacbaiviet.isNotEmpty
        ? ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.listbaiviet.length,
            itemBuilder: (BuildContext context, int index) {
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                      taiKhoan:
                                          widget.listbaiviet.elementAt(index),
                                    )));
                      },
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
                                      child: Image.network(
                                        'http://10.0.2.2/travel/img/${widget.listbaiviet.elementAt(index)["avt"]}',
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
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 0, 0),
                                            child: Text(
                                              widget.listbaiviet
                                                  .elementAt(index)["ho_ten"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: Text(widget.listbaiviet
                                                  .elementAt(index)["ngay_dang"]
                                                  .toString()),
                                            ),
                                            const Icon(Icons.group_sharp,
                                                size: 18)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    iconSize: 30,
                                    icon: const Icon(Icons.more_horiz_sharp))
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(6, 8, 0, 6),
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 360,
                                    child: Text(widget.listbaiviet
                                        .elementAt(index)["noi_dung"])),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetaiPlace(
                                    id: widget.listbaiviet
                                        .elementAt(index)["dia_danh_id"]
                                        .toString())));
                      },
                      child: Column(
                        children: [
                          Image.network(
                              'http://10.0.2.2/travel/img/${widget.listbaiviet.elementAt(index)["hinh_anh"]}',
                              width: 450,
                              fit: BoxFit.cover),
                          Container(
                            height: 90,
                            width: 450,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black12),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            widget.listbaiviet
                                                .elementAt(index)["ten"],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.red,
                                            ),
                                            Text(widget.listbaiviet
                                                .elementAt(index)["danh_gia"])
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      widget.listbaiviet
                                                  .elementAt(index)["mo_ta"]
                                                  .toString()
                                                  .length >
                                              100
                                          ? widget.listbaiviet
                                                  .elementAt(index)["mo_ta"]
                                                  .toString()
                                                  .substring(0, 96) +
                                              "..."
                                          : widget.listbaiviet
                                              .elementAt(index)["mo_ta"]
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 4, 12, 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: tuongtacbaiviet[widget.listbaiviet
                                            .elementAt(index)["id"]] !=
                                        null &&
                                    tuongtacbaiviet[widget.listbaiviet
                                            .elementAt(index)["id"]]['like'] !=
                                        "0"
                                ? Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.blue,
                                        child: Icon(
                                          Icons.thumb_up,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 3),
                                        child: tuongtacbaiviet[widget
                                                    .listbaiviet
                                                    .elementAt(index)["id"]] !=
                                                null
                                            ? Text(tuongtacbaiviet[widget
                                                    .listbaiviet
                                                    .elementAt(index)["id"]]
                                                ['like'])
                                            : const Text(''),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ),
                          Expanded(
                            child: tuongtacbaiviet[widget.listbaiviet
                                            .elementAt(index)["id"]] !=
                                        null &&
                                    tuongtacbaiviet[widget.listbaiviet
                                                .elementAt(index)["id"]]
                                            ['unlike'] !=
                                        "0"
                                ? Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.blue,
                                        child: Icon(
                                          Icons.thumb_down,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 3),
                                        child: tuongtacbaiviet[widget
                                                    .listbaiviet
                                                    .elementAt(index)["id"]] !=
                                                null
                                            ? Text(tuongtacbaiviet[widget
                                                    .listbaiviet
                                                    .elementAt(index)["id"]]
                                                ['unlike'])
                                            : const Text(''),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(widget.listbaiviet
                                .elementAt(index)['luot_xem']),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconTuongTac(tuongtacbaiviet,
                              widget.listbaiviet.elementAt(index)["id"], "0"),
                          iconTuongTac(tuongtacbaiviet,
                              widget.listbaiviet.elementAt(index)["id"], "1"),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove_red_eye),
                              ),
                              const Text('View')
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Row iconTuongTac(Map<String, dynamic> tuongtac, String index, String loai) {
    return Row(
      children: [
        IconButton(
          icon: tuongtac[index] != null
              ? (tuongtac[index]['tuong_tac'] == loai
                  ? (loai == "0"
                      ? const Icon(Icons.thumb_up)
                      : const Icon(Icons.thumb_down))
                  : (loai == "0"
                      ? const Icon(Icons.thumb_up_alt_outlined)
                      : const Icon(Icons.thumb_down_alt_outlined)))
              : loai == "0"
                  ? const Icon(Icons.thumb_up_alt_outlined)
                  : const Icon(Icons.thumb_down_alt_outlined),
          color: tuongtac[index] != null
              ? (tuongtac[index]['tuong_tac'] == loai
                  ? Colors.blue
                  : Colors.black)
              : Colors.black,
          onPressed: () {
            tuongtac[index] == null || tuongtac[index]['tuong_tac'] == -1
                ? themTuongTac(loai, index, username, "1")
                : (tuongtac[index]['tuong_tac'] == loai
                    ? themTuongTac('', index, username, "3")
                    : (loai == "1"
                        ? themTuongTac("1", index, username, "2")
                        : themTuongTac("0", index, username, "2")));
            loaddata();
          },
        ),
        Text(
          loai == "0" ? 'Like' : 'UnLike',
          style: TextStyle(
            color: tuongtac[index] != null
                ? (tuongtac[index]['tuong_tac'] == loai
                    ? Colors.blue
                    : Colors.black)
                : Colors.black,
          ),
        )
      ],
    );
  }
}
