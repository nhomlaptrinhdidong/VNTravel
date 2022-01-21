import 'dart:convert';

import 'package:du_lich_login/TaskBar/Home/home.dart';
import 'package:flutter/material.dart';

import '../../api.dart';

// ignore: must_be_immutable
class LoveScreen extends StatefulWidget {
  String ten;
  LoveScreen({Key? key, required this.ten}) : super(key: key);

  @override
  _LoveScreenState createState() => _LoveScreenState();
}

class _LoveScreenState extends State<LoveScreen> {
  Iterable listdiadanhlove = [];

  Future<void> loaddata() async {
    await API(
            url:
                "http://10.0.2.2/travel/api/listdiadanhyeuthich.php?ten_dang_nhap='${widget.ten}'")
        .getDataString()
        .then((value) {
      listdiadanhlove = json.decode(value);
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loaddata();
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
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [ListDiaDanh(context, listdiadanhlove)],
      ),
    );
  }
}
