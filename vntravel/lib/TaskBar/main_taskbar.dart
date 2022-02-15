import 'dart:convert';

import 'package:du_lich_login/TaskBar/Home/home.dart';
import 'package:du_lich_login/TaskBar/Love/love.dart';
import 'package:du_lich_login/TaskBar/News/news.dart';
import 'package:du_lich_login/TaskBar/Profile/profile.dart';
import 'package:du_lich_login/TaskBar/Setting/setting.dart';
import 'package:flutter/material.dart';
import '../api.dart';

// ignore: must_be_immutable
class MainTask extends StatefulWidget {
  String name;
  int index;
  MainTask({Key? key, required this.name, required this.index})
      : super(key: key);

  @override
  _MainTaskState createState() => _MainTaskState();
}

late Widget currentScreen;

class _MainTaskState extends State<MainTask> {
  Iterable chitiettaikhoan = [];
  int currentTab = 0;
  Future<void> getData() async {
    await API(
            url:
                "http://10.0.2.2/travel/api/chitiettaikhoan.php?ten_dang_nhap='${widget.name}'")
        .getDataString()
        .then((value) {
      chitiettaikhoan = json.decode(value);
    });
    setState(() {
      currentScreen = HomeScreen(taiKhoan: chitiettaikhoan.elementAt(0));
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  void initState() {
    super.initState();
    getData();
    // widget.index == 1 ? currentTab = 1 : currentTab = 0;
    currentTab = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return chitiettaikhoan.isNotEmpty
        ? Scaffold(
            body: PageStorage(
              child: currentTab == 1
                  ? const NewsScreen()
                  : (currentTab == 4
                      ? SettingScreen(taiKhoan: chitiettaikhoan.elementAt(0))
                      : currentScreen),
              bucket: bucket,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: widget.name != ""
                ? BottomAppBar(
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 10,
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    currentTab = 0;
                                    currentScreen = HomeScreen(
                                      taiKhoan: chitiettaikhoan.elementAt(0),
                                    );
                                  });
                                },
                                minWidth: 40,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: currentTab == 0
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    Text('Home',
                                        style: TextStyle(
                                          color: currentTab == 0
                                              ? Colors.blue
                                              : Colors.grey,
                                        ))
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    currentTab = 1;

                                    currentScreen = const NewsScreen();
                                  });
                                },
                                minWidth: 40,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.fiber_new_rounded,
                                      color: currentTab == 1
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    Text('News',
                                        style: TextStyle(
                                          color: currentTab == 1
                                              ? Colors.blue
                                              : Colors.grey,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    currentScreen = LoveScreen(
                                      ten: widget.name,
                                    );
                                    currentTab = 2;
                                  });
                                },
                                minWidth: 40,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite_outline,
                                      color: currentTab == 2
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    Text('Love',
                                        style: TextStyle(
                                          color: currentTab == 2
                                              ? Colors.blue
                                              : Colors.grey,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    currentScreen = ProfileScreen(
                                      taiKhoan: chitiettaikhoan.elementAt(0),
                                    );
                                    currentTab = 3;
                                  });
                                },
                                minWidth: 40,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.people,
                                      color: currentTab == 3
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    Text('Profile',
                                        style: TextStyle(
                                          color: currentTab == 3
                                              ? Colors.blue
                                              : Colors.grey,
                                        ))
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    currentScreen = SettingScreen(
                                      taiKhoan: chitiettaikhoan.elementAt(0),
                                    );
                                    currentTab = 4;
                                  });
                                },
                                minWidth: 40,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      color: currentTab == 4
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    Text('Setting',
                                        style: TextStyle(
                                          color: currentTab == 4
                                              ? Colors.blue
                                              : Colors.grey,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          )
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
