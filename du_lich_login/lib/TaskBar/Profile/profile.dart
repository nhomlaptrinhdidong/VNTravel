import 'package:flutter/material.dart';
String userAvatarUrl = 'https://scontent.fsgn8-2.fna.fbcdn.net/v/t1.6435-9/138778243_869342370492678_7336130306854756342_n.jpg?_nc_cat=110&cb=c578a115-2e46c7d2&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=EQXd37AU4mkAX-3vDoY&_nc_ht=scontent.fsgn8-2.fna&oh=00_AT-3IGz8RwKkYWsKT0nK9TslWWwTYH6cVtGkLvcGIkUOwQ&oe=61DF6017';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
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
            Text('Thanh Quý', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),),

          ],
        ),
      ),
    );
  }
}