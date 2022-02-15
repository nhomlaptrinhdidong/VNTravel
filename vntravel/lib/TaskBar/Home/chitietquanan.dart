import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../api.dart';
import 'chitietmonan.dart';

// ignore: must_be_immutable
class DetailRestaurant extends StatefulWidget {
  Map<String, dynamic> quanAn;
  DetailRestaurant({Key? key, required this.quanAn}) : super(key: key);

  @override
  _DetailRestaurantState createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurant> {
  Iterable listmonan = [];
  Future<void> listMonAn() async {
    await API(
            url:
                "http://10.0.2.2/travel/api/listmonanthuocquan.php?id='${widget.quanAn['id']}'")
        .getDataString()
        .then((value) {
      listmonan = json.decode(value);
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    listMonAn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel'),
      ),
      body: ListView(
        children: [
          Center(
              child: Image.network(
                  'http://10.0.2.2/travel/img/${widget.quanAn['hinh_anh']}')),
          //Tên địa danh
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  widget.quanAn['ten_quan'],
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w300),
                ),
              ),
              //Điểm đánh giá
            ],
          ),
          //Mô tả
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'MÓN ĂN Ở QUÁN',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
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
                                        .format(int.parse(listmonan
                                            .elementAt(index)['gia_tien']))),
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

          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        const Text(
                          'Địa chỉ: ',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(widget.quanAn['dia_chi']),
                        )
                      ],
                    ),
                  ),
                ),
                // Container(
                //   height: 80,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //   color: Colors.blue[400],
                //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),),
                //   child: Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: Text(slogan_Text,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
