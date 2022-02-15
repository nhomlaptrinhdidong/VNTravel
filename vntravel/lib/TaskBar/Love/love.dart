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
  TextEditingController scrollController = TextEditingController();
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

  bool flag = true;
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
        children: [
          ListDiaDanh(context, listdiadanhlove),
        ],
      ),
      // body: GestureDetector(
      //   onTap: () {
      //     flag = true;
      //     setState(() {});
      //   },
      //   child: Stack(
      //     children: [
      //       Expanded(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             flag = !flag;
      //             setState(() {});
      //           },
      //           child: Text("ggsas"),
      //         ),
      //       ),
      //       flag == false
      //           ? Expanded(
      //               child: SizedBox.expand(
      //                 child: DraggableScrollableSheet(
      //                   minChildSize: 0,
      //                   maxChildSize: 1,
      //                   builder: (BuildContext context,
      //                       ScrollController scrollController) {
      //                     return Container(
      //                       color: Colors.blue[100],
      //                       child: ListView.builder(
      //                         controller: scrollController,
      //                         itemCount: 25,
      //                         itemBuilder: (BuildContext context, int index) {
      //                           return ListTile(title: Text('Item $index'));
      //                         },
      //                       ),
      //                     );
      //                   },
      //                 ),
      //               ),
      //             )
      //           : const SizedBox()
      //     ],
      //   ),
      // )
    );
  }
}
