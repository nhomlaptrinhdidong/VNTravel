import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DetailDish extends StatefulWidget {
  Map<String, dynamic> monAn;
  DetailDish({Key? key, required this.monAn}) : super(key: key);

  @override
  _DetailDishState createState() => _DetailDishState();
}

class _DetailDishState extends State<DetailDish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel')),
      body: ListView(
        children: [
          Center(
              child: Image.network(
                  'http://10.0.2.2/travel/img/${widget.monAn['hinh_anh_mon_an']}')),
          //Tên địa danh
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  widget.monAn['ten_mon'],
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          //Mô tả
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(widget.monAn['mo_ta'], textAlign: TextAlign.justify),
          ),
          //Chi tiết
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Giá: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text(
                      NumberFormat.currency(locale: 'vi')
                          .format(int.parse(widget.monAn['gia_tien'])),
                      style: const TextStyle(color: Colors.red, fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          ),
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
