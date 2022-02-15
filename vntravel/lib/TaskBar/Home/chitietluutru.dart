import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailHotel extends StatefulWidget {
  Map<String, dynamic> luuTru;
  DetailHotel({Key? key, required this.luuTru}) : super(key: key);

  @override
  _DetailHotelState createState() => _DetailHotelState();
}

class _DetailHotelState extends State<DetailHotel> {
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
                  'http://10.0.2.2/travel/img/${widget.luuTru['hinh_anh']}')),
          //Tên địa danh
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  widget.luuTru['ten_luu_tru'],
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w300),
                ),
              ),
              //Điểm đánh giá
            ],
          ),
          //Mô tả
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(widget.luuTru['mo_ta'], textAlign: TextAlign.justify),
          ),
          //Chi tiết
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Số điện thoại: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      widget.luuTru['sdt'],
                      style: const TextStyle(color: Colors.red, fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          ),
          //Địa chỉ
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
            child: Column(
              children: [
                Container(
                  height: 120,
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
                          child: Text(widget.luuTru['dia_chi']),
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
