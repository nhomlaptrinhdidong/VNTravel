import 'dart:convert';

import 'package:du_lich_login/TaskBar/Home/detailplace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../api.dart';

// ignore: must_be_immutable
class Rate extends StatefulWidget {
  String username;
  String idDiaDanh;
  Rate({Key? key, required this.username, required this.idDiaDanh})
      : super(key: key);

  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  double rate = 0;
  bool result = false;
  TextEditingController noiDung = TextEditingController();
  Future<void> upRate() async {
    {
      await API(
              url:
                  "http://10.0.2.2/travel/api/themdanhgia.php?id_dia_danh='${widget.idDiaDanh}'&id_nguoi_dung='${widget.username}'&so_sao='$rate'&noi_dung='${noiDung.text}'")
          .getDataString()
          .then((value) {
        result = json.decode(value);
      });
      setState(() {});
    }
    if (result == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => DetaiPlace(id: widget.idDiaDanh)));
    } else {
      const CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Travel'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
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
                            children: const [
                              Text('Đánh giá: ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                              Text('5',
                                  style: TextStyle(
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
                        Padding(
                          padding: const EdgeInsets.all(1.4),
                          child: TextField(
                            controller: noiDung,
                            decoration: const InputDecoration(
                                hintText: 'Nhận xét', border: InputBorder.none),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: ElevatedButton(
                            onPressed: () {
                              upRate();
                            },
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
            ],
          ),
        ));
  }
}
