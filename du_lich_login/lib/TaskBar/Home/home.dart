import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool liked = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          drawer: Drawer(
            child: Material(
              color: Color.fromRGBO(50, 75, 205, 1),
              child: ListView(
                padding: EdgeInsets.all(8),
                children: const [
                  SizedBox(
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              bottom: TabBar(
                tabs: [
                  Container(
                      height: 30,
                      child: Tab(
                        text: 'Du Lịch',
                      )),
                  Container(
                      height: 30,
                      child: Tab(
                        text: 'Nghĩ Dưỡng',
                      )),
                  Container(
                      height: 30,
                      child: Tab(
                        text: 'Dã Ngoại',
                      )),
                  Container(
                      height: 30,
                      child: Tab(
                        text: 'Cấm Trại',
                      )),
                ],
              ),
              title: Text('VNTravel'),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.messenger_outline_rounded),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: const [
              TabTravel(),
              TabTravel(),
              TabTravel(),
              Text('data')
            ],
          )),
    );
  }
}

class TabTravel extends StatelessWidget {
  const TabTravel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ListDiaDanhHot('Núi Phú Sĩ', 'nui.jpg'),
            ListDiaDanhHot('Núi Cô Tiên', 'nuicotien.jpg'),
            ListDiaDanhHot('Đia Đạo Củ Chi', 'download.jpg'),
            ListDiaDanhHot('Núi Phú Sĩ', 'nui.jpg'),
          ],
        ),
      ),
      Wrap(
        children: [
          ListDiaDanh('Núi Cô Tiên', 'nuicotien.jpg'),
          ListDiaDanh('Đia Đạo Củ Chi', 'download.jpg'),
          ListDiaDanh('Đia Đạo Củ Chi', 'download.jpg'),
          ListDiaDanh('Núi Phú Sĩ', 'nui.jpg'),
        ],
      ),
    ]);
  }
}

Container ListDiaDanhHot(String name, String img) {
  return Container(
    margin: EdgeInsets.all(7),
    child: Stack(
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'images/diadanh/$img',
                height: 180,
                width: 330,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(top: 120),
            height: 60,
            width: 330,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.black45),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          Rate(),
                          Rate(),
                          Rate(),
                          Rate(),
                          Rate(),
                          Container(
                            padding: EdgeInsets.only(left: 3),
                            child: Text('5',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )),
      ],
    ),
  );
}

class Rate extends StatelessWidget {
  const Rate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: Icon(
        Icons.star,
        color: Colors.red,
      ),
    );
  }
}

Container ListDiaDanh(String name, String img) {
  return Container(
    margin: const EdgeInsets.all(7),
    child: Stack(
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'images/diadanh/$img',
                height: 180,
                width: 190,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(top: 120),
            height: 60,
            width: 190,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.black45),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          Rate(),
                          Rate(),
                          Rate(),
                          Rate(),
                          Rate(),
                          Container(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text('5',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )),
      ],
    ),
  );
}
