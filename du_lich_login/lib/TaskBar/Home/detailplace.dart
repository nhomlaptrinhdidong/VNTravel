import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import '../../api.dart';

class DetaiPlace extends StatefulWidget {
  final String id;
  // ignore: use_key_in_widget_constructors
  const DetaiPlace({required this.id});
  @override
  _DetaiPlaceState createState() => _DetaiPlaceState();
}

class _DetaiPlaceState extends State<DetaiPlace> {
  Iterable chitietdiadanh = [];
  Future<void> chitiet() async {
    await API(
            url:
                "http://10.0.2.2/travel/api/chitietdiadanh.php?id=${widget.id}")
        .getDataString()
        .then((value) {
      chitietdiadanh = json.decode(value);
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
          : const CircularProgressIndicator(),
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
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text(
                chitietdiadanh.elementAt(0)['ten'].toString(),
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
              ),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {
                    openMap(chitietdiadanh);
                  },
                  icon: const Icon(Icons.location_on_outlined)),
            )
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
                  textAlign: TextAlign.justify),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                  "Vùng: ${chitietdiadanh.elementAt(0)['ten_vung'].toString()}",
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
                          const Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 50,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 50,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 50,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 50,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 50,
                          ),
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
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "aloalo",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: const Text(
                      'Quán Ăn',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ListQuanAn("avt.jpg", "Sườn bì chả"),
                        ListQuanAn("avt.jpg", "Sườn bì chả"),
                        ListQuanAn("avt.jpg", "Sườn bì chả"),
                        ListQuanAn("avt.jpg", "Sườn bì chả"),
                        ListQuanAn("avt.jpg", "Sườn bì chả")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Container ListQuanAn(String hinhAnh, String tenQuan) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: Stack(
        children: [
          Container(
            width: 180,
            height: 184,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'images/user/$hinhAnh',
                  height: 140,
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
            width: 100,
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
                  maxLines: 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
