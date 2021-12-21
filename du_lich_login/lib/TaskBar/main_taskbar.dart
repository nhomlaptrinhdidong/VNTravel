import 'package:du_lich_login/TaskBar/Home/home.dart';
import 'package:du_lich_login/TaskBar/News/news.dart';
import 'package:du_lich_login/TaskBar/Profile/profile.dart';
import 'package:du_lich_login/TaskBar/Setting/setting.dart';
import 'package:flutter/material.dart';

class MainTask extends StatefulWidget {
  const MainTask({ Key? key }) : super(key: key);

  @override
  _MainTaskState createState() => _MainTaskState();
}

class _MainTaskState extends State<MainTask> {
  int currentTab = 0;
  final List<Widget> screen = 
  [
    HomeScreen(),
    NewsScreen(),
    ProfileScreen(),
    SettingScreen(),
  ];
  
  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Thêm bài viết tại đây
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(onPressed: () {
                    setState(() {
                      currentScreen = HomeScreen();
                      currentTab = 0;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, color: currentTab == 0 ? Colors.blue : Colors.grey,),
                      Text('Home', style: TextStyle( color: currentTab == 0 ? Colors.blue : Colors.grey, ))
                    ],
                  ),),
                  MaterialButton(onPressed: () {
                    setState(() {
                      currentScreen = NewsScreen();
                      currentTab = 1;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.fiber_new_rounded, color: currentTab == 1 ? Colors.blue : Colors.grey,),
                      Text('News', style: TextStyle( color: currentTab == 1 ? Colors.blue : Colors.grey, ))
                    ],
                  ),),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(onPressed: () {
                    setState(() {
                      currentScreen = ProfileScreen();
                      currentTab = 3;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people, color: currentTab == 3 ? Colors.blue : Colors.grey,),
                      Text('Profile', style: TextStyle( color: currentTab == 3 ? Colors.blue : Colors.grey, ))
                    ],
                  ),),
                  MaterialButton(onPressed: () {
                    setState(() {
                      currentScreen = SettingScreen();
                      currentTab = 4;
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings, color: currentTab == 4 ? Colors.blue : Colors.grey,),
                      Text('Setting', style: TextStyle( color: currentTab == 4 ? Colors.blue : Colors.grey, ))
                    ],
                  ),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}