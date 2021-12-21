import 'package:flutter/material.dart';
import 'package:vn_travel/ChinhSua.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 285,
                  width: 500,
                  color: Colors.white10,
                ),
                Container(
                  height: 200,
                  width: 500,
                  child: Image.asset(
                    "images/1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 150,
                    left: 420,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(300)),
                      child: Container(
                        height: 30,
                        width: 50,
                        color: Colors.white,
                        child: Icon(Icons.camera_alt),
                      ),
                    )),
                Positioned(
                    top: 100,
                    left: 20,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage("images/2.jpg"),
                      ),
                    )),
                Positioned(
                    top: 210,
                    left: 133,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey[500],
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
            Text(
              'Thanh Quý (Qy)',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  fontStyle: FontStyle.normal),
            ),
            Text(
              'Độc Thân Vui Tính !',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChinhSua()));
              },
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: 40,
                      width: 300,
                      color: Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.mode_rounded),
                          Text(
                            'Chỉnh Sửa Trang Cá Nhân',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    child: Container(
                      height: 40,
                      width: 50,
                      color: Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.more_horiz_rounded),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(
                Icons.email_outlined,
                size: 40,
                color: Colors.black,
              ),
              title: Text(
                'lethanhquy.0878@gmail.com',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              leading: Icon(
                Icons.favorite_outlined,
                size: 40,
                color: Colors.black,
              ),
              title: Text(
                'Độc Thân',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(
                Icons.rss_feed_sharp,
                size: 40,
                color: Colors.black,
              ),
              title: Text(
                'Có 5.768.234 người theo dõi',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        newPost('da', "username", "2.jpg", "1.jpg"),
        newPost('da', "username", "2.jpg", "1.jpg")
      ],
    ));
  }
}

Container newPost(String description, username, imagesAvt, images) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'images/$imagesAvt',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                          child: Text(
                            username,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Text('1 giờ trước'),
                          ),
                          Icon(Icons.group_sharp, size: 18)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 6),
          child: Row(
            children: [],
          ),
        ),
        Image.asset('images/$images', width: 450, fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
          padding: EdgeInsets.fromLTRB(20, 30, 12, 12),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.thumb_up,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.favorite,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text('1.232'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text('645 bình luận • 490 lượt chia sẻ'),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 12),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up, color: Colors.blue),
                    ),
                    Text('Like')
                  ],
                ),
                flex: 2,
              ),
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.messenger_outline),
                    ),
                    Text('Comment')
                  ],
                ),
                flex: 2,
              ),
              Expanded(
                child: Row(
                  children: [Text('Share')],
                ),
                flex: 1,
              )
            ],
          ),
        )
      ],
    ),
  );
}
