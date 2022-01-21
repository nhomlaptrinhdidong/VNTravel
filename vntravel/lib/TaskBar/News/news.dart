import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../api.dart';
import 'listbaiviet.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

Random random = Random();
int randomNumber = random.nextInt(100);
Iterable listbaiviet = [];

class _NewsScreenState extends State<NewsScreen> {
  bool liked = false;
  Future<void> loaddata() async {
    await API(url: "http://10.0.2.2/travel/api/listbaiviet.php")
        .getDataString()
        .then((value) {
      listbaiviet = json.decode(value);
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
      body: listbaiviet.isNotEmpty
          ? ListView(
              children: [
                ListBaiViet(listbaiviet: listbaiviet),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
