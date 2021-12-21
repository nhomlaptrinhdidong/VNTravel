import 'package:flutter/material.dart';

String userAvatarUrl = 'https://scontent.fsgn8-2.fna.fbcdn.net/v/t1.6435-9/138778243_869342370492678_7336130306854756342_n.jpg?_nc_cat=110&cb=c578a115-2e46c7d2&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=EQXd37AU4mkAX-3vDoY&_nc_ht=scontent.fsgn8-2.fna&oh=00_AT-3IGz8RwKkYWsKT0nK9TslWWwTYH6cVtGkLvcGIkUOwQ&oe=61DF6017';

class SettingScreen extends StatefulWidget {
  const SettingScreen({ Key? key }) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(userAvatarUrl),
                backgroundColor: Colors.brown.shade800,
                //child: const Text('AH'),
              ),
            ),
          ),
          Center(child: Text('Thanh Quý', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, ),)),
          Center(child: Text('ThanhQuy@gmail.com', style: TextStyle(fontSize: 15, color: Colors.grey),),),
          //Thông báo ------------------------------------------------------------------------------------
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifications'),
                    ),
                  ),
                )
              ],
            ),
          ),
          //Vị trí ------------------------------------------------------------------------------------
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.place),
                      title: Text('Location'),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Tours ------------------------------------------------------------------------------------
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.airplane_ticket),
                      title: Text('Tours'),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Invite Friends ------------------------------------------------------------------------------------
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.people),
                      title: Text('Invite Friends'),
                    ),
                  ),
                )
              ],
            ),
          ),
          //Line ------------------------------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
            child: Container(
              height: 1,
              color: Colors.grey,
            ),
          ),
          // Help Center ------------------------------------------------------------------------------------
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.headset_mic),
                      title: Text('Help Center'),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Setting ------------------------------------------------------------------------------------
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Logout ------------------------------------------------------------------------------------
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}