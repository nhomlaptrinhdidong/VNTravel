import 'package:du_lich_login/TaskBar/Home/home.dart';
import 'package:du_lich_login/TaskBar/Love/love.dart';
import 'package:du_lich_login/TaskBar/News/news.dart';
import 'package:du_lich_login/TaskBar/Profile/profile.dart';
import 'package:du_lich_login/TaskBar/Setting/setting.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';

class MainTask extends StatefulWidget {
  const MainTask({Key? key}) : super(key: key);

  @override
  _MainTaskState createState() => _MainTaskState();
}

class _MainTaskState extends State<MainTask> {
  String username = "";
  int currentTab = 0;
  final List<Widget> screen = [
    const HomeScreen(),
    const NewsScreen(),
    ProfileScreen(
      ten: "",
    ),
    const SettingScreen(),
    const SettingScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  Future<void> getSession() async {
    username = await FlutterSession().get("myData");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: username != ""
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
                              currentScreen = const HomeScreen();
                              currentTab = 0;
                            });
                          },
                          minWidth: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                                color:
                                    currentTab == 0 ? Colors.blue : Colors.grey,
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
                              currentScreen = const NewsScreen();
                              currentTab = 1;
                            });
                          },
                          minWidth: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.fiber_new_rounded,
                                color:
                                    currentTab == 1 ? Colors.blue : Colors.grey,
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
                                ten: username,
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
                                color:
                                    currentTab == 2 ? Colors.blue : Colors.grey,
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
                                ten: username,
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
                                color:
                                    currentTab == 3 ? Colors.blue : Colors.grey,
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
                              currentScreen = const SettingScreen();
                              currentTab = 4;
                            });
                          },
                          minWidth: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.settings,
                                color:
                                    currentTab == 4 ? Colors.blue : Colors.grey,
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
          : const CircularProgressIndicator(),
    );
  }
}
