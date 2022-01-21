import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';
import 'package:map_launcher/map_launcher.dart';
import '../../api.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  double rate = 0;
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
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                  "Vùng: ${chitietdiadanh.elementAt(0)['ten_vung'].toString()}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text('Đánh giá: ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                              Text(
                                  chitietdiadanh
                                      .elementAt(0)['danh_gia']
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300))
                            ],
                          ),
                          RatingBar.builder(
                              minRating: 1,
                              itemBuilder: (context, _) =>
                                  const Icon(Icons.star, color: Colors.amber),
                              onRatingUpdate: (raiting) {
                                setState(() {
                                  rate = raiting;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nhận xét',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            child: const Text('Gửi',
                                style: TextStyle(fontSize: 20)),
                          ),
                        )
                      ],
                    )),
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'QUÁN ĂN GẦN NHẤT',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  listquanan.isNotEmpty
                      ? SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemCount: listquanan.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return QuanAn(
                                  listquanan
                                      .elementAt(index)["hinh_anh"]
                                      .toString(),
                                  listquanan
                                      .elementAt(index)["ten_quan"]
                                      .toString());
                            },
                          ),
                        )
                      : const Text("Chưa có danh sách quán ăn"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Container QuanAn(String hinhAnh, String tenQuan) {
    return Container(
      width: 180,
      height: 184,
      margin: const EdgeInsets.all(7),
      child: Stack(
        children: [
          Container(
            width: 180,
            height: 184,
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
            padding: const EdgeInsets.fromLTRB(12, 150, 0, 0),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
