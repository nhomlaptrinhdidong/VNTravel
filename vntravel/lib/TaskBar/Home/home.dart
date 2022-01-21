import 'dart:convert';
import 'package:du_lich_login/LoginForgotSignup/loginform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';
import '../../api.dart';
import 'detailplace.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool liked = false;
Iterable listdiadanh = [];
Iterable listdiadanhhot = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          drawer: Drawer(
            child: Material(
              color: const Color.fromRGBO(50, 75, 205, 1),
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: const [
                  SizedBox(
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: AppBar(
              bottom: const TabBar(
                tabs: [
                  SizedBox(
                      height: 30,
                      child: Tab(
                        text: 'Du Lịch',
                      )),
                  SizedBox(
                      height: 30,
                      child: Tab(
                        text: 'Nghĩ Dưỡng',
                      )),
                  SizedBox(
                      height: 30,
                      child: Tab(
                        text: 'Dã Ngoại',
                      )),
                  SizedBox(
                      height: 30,
                      child: Tab(
                        text: 'Cấm Trại',
                      )),
                ],
              ),
              title: Row(
                children: <Widget>[
                  const Text("Travel"),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        isDense: true,
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        FlutterSession().set('myData', '');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginForm()),
                            (Route<dynamic> route) => false);
                      },
                      icon: const Icon(Icons.exit_to_app))
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [TabTravel(), TabTravel(), TabTravel(), Text('data')],
          )),
    );
  }
}

class TabTravel extends StatefulWidget {
  const TabTravel({Key? key}) : super(key: key);

  @override
  _TabTravelState createState() => _TabTravelState();
}

String username = "";

class _TabTravelState extends State<TabTravel> {
  Future<void> getSession() async {
    username = await FlutterSession().get("myData");
    setState(() {});
  }

  Future<void> loaddata() async {
    await API(url: "http://10.0.2.2/travel/api/listdiadanh.php")
        .getDataString()
        .then((value) {
      listdiadanh = json.decode(value);
    });
    await API(url: "http://10.0.2.2/travel/api/listdiadanhhot.php")
        .getDataString()
        .then((value) {
      listdiadanhhot = json.decode(value);
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getSession();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      listdiadanhhot.isNotEmpty
          ? DiaDanhHot()
          : const Center(child: CircularProgressIndicator()),
      ListDiaDanh(context, listdiadanh),
    ]);
  }
}

// ignore: non_constant_identifier_names
SizedBox DiaDanhHot() {
  return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listdiadanhhot.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetaiPlace(
                          id: listdiadanhhot.elementAt(i)["id"].toString())),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(6),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'http://10.0.2.2/travel/img/${listdiadanhhot.elementAt(i)["hinh_anh"].toString()}',
                            height: 180,
                            width: 330,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 3),
                            child: const Text('5',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 120),
                        height: 60,
                        width: 330,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black45),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    listdiadanhhot
                                        .elementAt(i)["ten"]
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                    listdiadanhhot
                                                .elementAt(i)["mo_ta"]
                                                .toString()
                                                .length >
                                            100
                                        ? listdiadanhhot
                                                .elementAt(i)["mo_ta"]
                                                .toString()
                                                .substring(0, 96) +
                                            "..."
                                        : listdiadanhhot
                                            .elementAt(i)["mo_ta"]
                                            .toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    )),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            );
          }));
}

// ignore: non_constant_identifier_names
RenderObjectWidget ListDiaDanh(BuildContext context, Iterable listdiadanh) {
  return listdiadanh.isNotEmpty
      ? DiaDanh(context, listdiadanh)
      : const Center(child: CircularProgressIndicator());
}

// ignore: non_constant_identifier_names
Wrap DiaDanh(BuildContext context, Iterable listdiadanh) {
  return Wrap(
      children: List.generate(
          listdiadanh.length,
          (i) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetaiPlace(
                            id: listdiadanh.elementAt(i)["id"].toString())),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(7),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'http://10.0.2.2/travel/img/${listdiadanh.elementAt(i)["hinh_anh"].toString()}',
                              height: 190,
                              width: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 120),
                          height: 70,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black45),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      listdiadanh
                                          .elementAt(i)["ten"]
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    Row(
                                      children: [
                                        Row(children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3),
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.red,
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 3),
                                            child: Text(
                                                listdiadanh
                                                    .elementAt(i)["danh_gia"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 70),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Transform(
                                                  alignment: Alignment.center,
                                                  transform: Matrix4.rotationY(
                                                      math.pi),
                                                  child: const Icon(Icons.reply,
                                                      color: Colors.white)),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              )));
}
