import 'dart:convert';
import 'package:du_lich_login/TaskBar/Home/chitietluutru.dart';
import 'package:du_lich_login/TaskBar/Home/chitietquanan.dart';
import 'package:du_lich_login/TaskBar/Home/ratepage.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';
import 'package:intl/intl.dart';
import 'package:map_launcher/map_launcher.dart';
import '../../api.dart';
import 'chitietmonan.dart';

class DetaiPlace extends StatefulWidget {
  final String id;
  // ignore: use_key_in_widget_constructors
  const DetaiPlace({required this.id});
  @override
  _DetaiPlaceState createState() => _DetaiPlaceState();
}

class _DetaiPlaceState extends State<DetaiPlace> {
  Iterable chitietdiadanh = [];
  Iterable checklove = [];
  Iterable listquanan = [];
  Iterable listluutru = [];
  Iterable listdanhgia = [];
  Iterable listmonan = [];

  num rate = 0;
  String username = "";
  Future<void> love(String type) async {
    await API(
            url:
                "http://10.0.2.2/travel/api/${type}_yeu_thich_dia_danh.php?id_nguoi_dung='$username'&id_dia_danh='${widget.id}'")
        .getDataString();
  }

  Future<void> chitiet() async {
    username = await FlutterSession().get("myData");
    await API(
            url:
                "http://10.0.2.2/travel/api/chitietdiadanh.php?id=${widget.id}")
        .getDataString()
        .then((value) {
      chitietdiadanh = json.decode(value);
    });
    await API(
            url:
                "http://10.0.2.2/travel/api/check_yeu_thich.php?id_nguoi_dung='$username'&id_dia_danh='${widget.id}'")
        .getDataString()
        .then((value) {
      checklove = json.decode(value);
    });
    await API(
            url: "http://10.0.2.2/travel/api/listquanan.php?id='${widget.id}'")
        .getDataString()
        .then((value) {
      listquanan = json.decode(value);
    });
    await API(
            url: "http://10.0.2.2/travel/api/listluutru.php?id='${widget.id}'")
        .getDataString()
        .then((value) {
      listluutru = json.decode(value);
    });
    await API(url: "http://10.0.2.2/travel/api/listmonan.php?id='${widget.id}'")
        .getDataString()
        .then((value) {
      listmonan = json.decode(value);
    });
    await API(
            url: "http://10.0.2.2/travel/api/listdanhgia.php?id='${widget.id}'")
        .getDataString()
        .then((value) {
      listdanhgia = json.decode(value);
    });
    await API(
            url:
                "http://10.0.2.2/travel/api/so_sao_trung_binh.php?id='${widget.id}'")
        .getDataString()
        .then((value) {
      rate = json.decode(value);
    });
    setState(() {});
  }

  void openMap(Iterable chitietdiadanh) async {
    final availableMaps = await MapLauncher.installedMaps;
    await availableMaps.first.showMarker(
      coords: Coords(double.parse(chitietdiadanh.elementAt(0)['kinh_do']),
          double.parse(chitietdiadanh.elementAt(0)['vi_do'])),
      title: chitietdiadanh.elementAt(0)['ten'],
    );
  }

  @override
  void initState() {
    super.initState();
    chitiet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel"),
      ),
      body: chitietdiadanh.isNotEmpty
          ? chiTietDiaDanh()
          : const Center(child: CircularProgressIndicator()),
    );
  }

  ListView chiTietDiaDanh() {
    return ListView(
      children: [
        //Ảnh địa danh
        Image.network(
          'http://10.0.2.2/travel/img/${chitietdiadanh.elementAt(0)['hinh_anh'].toString()}',
          fit: BoxFit.cover,
        ),
        //Tên địa danh
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  chitietdiadanh.elementAt(0)['ten'].toString(),
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w300),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  openMap(chitietdiadanh);
                },
                icon: const Icon(
                  Icons.location_on_outlined,
                  size: 30,
                )),
            IconButton(
              icon: checklove.isNotEmpty
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    )
                  : const Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                      size: 30,
                    ),
              onPressed: () {
                checklove.isNotEmpty ? love("xoa") : love("them");
                chitiet();

                setState(() {});
              },
            ),
          ],
        ),
        //Mô tả
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(chitietdiadanh.elementAt(0)['mo_ta'].toString(),
              textAlign: TextAlign.justify),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                  "Miền: ${chitietdiadanh.elementAt(0)['ten_mien'].toString()}",
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                  "Vùng: ${chitietdiadanh.elementAt(0)['ten_vung'].toString()}",
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify),
            ),
          ],
        ),
        Column(
          children: [
            Column(
              children: [
                Text(
                  rate.toString(),
                  style: const TextStyle(fontSize: 50),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        children: List.generate(rate.toInt(),
                            (i) => const Icon(Icons.star, color: Colors.amber)),
                      ),
                      Wrap(
                        children: List.generate(
                            5 - rate.toInt(),
                            (i) => const Icon(Icons.star_border_outlined,
                                color: Colors.amber)),
                      )
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) =>
                            Rate(username: username, idDiaDanh: widget.id)));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 115),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.black, spreadRadius: 1.5),
                  ],
                ),
                height: 40,
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.insert_comment_outlined),
                    ),
                    Text('Viết bài đánh giá')
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'MÓN ĂN GẦN NHẤT',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              listmonan.isNotEmpty
                  ? SizedBox(
                      height: 240,
                      child: ListView.builder(
                        itemCount: listmonan.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => DetailDish(
                                          monAn: listmonan.elementAt(index))));
                            },
                            child: Container(
                              width: 180,
                              height: 220,
                              margin: const EdgeInsets.all(7),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 180,
                                    height: 210,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: Colors.black12,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'http://10.0.2.2/travel/img/${listmonan.elementAt(index)['hinh_anh_mon_an']}',
                                          height: 140,
                                          width: 180,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 150, 8, 8),
                                    child: Column(
                                      children: [
                                        Text(
                                          listmonan.elementAt(index)['ten_mon'],
                                          style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                        Text(NumberFormat.currency(locale: 'vi')
                                            .format(int.parse(
                                                listmonan.elementAt(
                                                    index)['gia_tien']))),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Text(
                                            listmonan.elementAt(index)['mo_ta'],
                                            style: const TextStyle(
                                              color: Colors.black87,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const Text('Chưa có danh sách món ăn'),
              listQuanAn(),
              listLuuTru(),
              Column(
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'NHẬN XÉT',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  listdanhgia.isNotEmpty
                      ? SizedBox(
                          height: 500,
                          child: ListView.builder(
                            itemCount: listdanhgia.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              'http://10.0.2.2/travel/img/${listdanhgia.elementAt(index)['avt']}',
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 8, 0, 0),
                                                child: Text(
                                                  listdanhgia.elementAt(
                                                      index)['ho_ten'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          iconSize: 30,
                                          icon: const Icon(
                                              Icons.more_horiz_sharp))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Wrap(
                                          children: List.generate(
                                              int.parse(listdanhgia
                                                  .elementAt(index)['so_sao']),
                                              (i) => const Icon(Icons.star,
                                                  color: Colors.amber)),
                                        ),
                                        Wrap(
                                          children: List.generate(
                                              5 -
                                                  int.parse(
                                                      listdanhgia.elementAt(
                                                          index)['so_sao']),
                                              (i) => const Icon(
                                                  Icons.star_border_outlined,
                                                  color: Colors.amber)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(listdanhgia
                                        .elementAt(index)['noi_dung']),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      : const Text("Chưa có nhận xét nào"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column listQuanAn() {
    return Column(
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'QUÁN ĂN',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
        listquanan.isNotEmpty
            ? SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: listquanan.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => DetailRestaurant(
                                      quanAn: listquanan.elementAt(index),
                                    )));
                      },
                      child: QuanAnLuuTru(
                          listquanan.elementAt(index)["hinh_anh"].toString(),
                          listquanan.elementAt(index)["ten_quan"].toString(),
                          listquanan.elementAt(index)["dia_chi"].toString(),
                          listquanan.elementAt(index),
                          DetailRestaurant(
                            quanAn: listquanan.elementAt(index),
                          )),
                    );
                  },
                ),
              )
            : const Text("Chưa có danh sách quán ăn"),
      ],
    );
  }

  Column listLuuTru() {
    return Column(
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'LƯU TRÚ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
        listluutru.isNotEmpty
            ? SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: listluutru.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return QuanAnLuuTru(
                        listluutru.elementAt(index)["hinh_anh"].toString(),
                        listluutru.elementAt(index)["ten_luu_tru"].toString(),
                        listluutru.elementAt(index)["dia_chi"].toString(),
                        listluutru.elementAt(index),
                        DetailHotel(luuTru: listluutru.elementAt(index)));
                  },
                ),
              )
            : const Text("Chưa có danh sách nơi lưu trú"),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  GestureDetector QuanAnLuuTru(String hinhAnh, String tenQuan, String diaChi,
      Map<String, dynamic> quanAnLuuTru, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => screen));
      },
      child: Container(
        width: 180,
        height: 220,
        margin: const EdgeInsets.all(7),
        child: Stack(
          children: [
            Container(
              width: 180,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.black12,
              ),
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'http://10.0.2.2/travel/img/$hinhAnh',
                    height: 140,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 150, 8, 8),
              child: Column(
                children: [
                  Text(
                    tenQuan,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      diaChi,
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
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
