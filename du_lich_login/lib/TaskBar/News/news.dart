import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

Random random = new Random();
int randomNumber = random.nextInt(100);

class _NewsScreenState extends State<NewsScreen> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    final String description =
        "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

    return Scaffold(
        appBar: AppBar(
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
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          //shrinkWrap: true,
          children: [
            titleSection(),
            function(),
            listStory(),
            newPost('Chị dẹp', 'Huy Quần Hoa', 'tt.jpg', 'nt.jpg'),
            newPost(description, 'Huy Quần Hoa', 'st.jpg', 'avt.jpg'),
            newPost(description, 'Bill', 'avt.jpg', 'avt.jpg'),
            newPost(description, 'Bill', 'avt.jpg', 'avt.jpg'),
          ],
        ));
  }

  Container listStory() {
    return Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            singleStory('avt.jpg', 'hnh.jpg', 'Tống Thành Tài'),
            singleStory('tl.jpg', 'hnh.jpg', 'Tiến Lữ'),
            singleStory('vkt.jpg', 'nt.jpg', 'Vũ Khắc Tiệp'),
            singleStory('nt.jpg', 'vkt.jpg', 'Ngọc Trinh'),
            singleStory('st.jpg', 'hnh.jpg', 'Sơn Tùng MTP'),
            singleStory('hnh.jpg', 'st.jpg', 'Hồ Ngọc Hà'),
            singleStory('bg.jpg', 'avt.jpg', 'Bill Gates'),
            singleStory('tt.jpg', 'bg.jpg', 'Huy Quần Hoa'),
            singleStory('avt.jpg', 'hnh.jpg', 'Bill'),
            singleStory('avt.jpg', 'hnh.jpg', 'Bill'),
          ],
        ));
  }

  Container singleStory(String img, String avt, String username) {
    return Container(
      margin: EdgeInsets.all(7),
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'images/user/$avt',
                  height: 184,
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 2,
                  color: Colors.blue,
                )),
            margin: EdgeInsets.fromLTRB(12, 12, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'images/user/$img',
                width: 40,
                height: 40,
              ),
            ),
          ),
          Container(
            width: 100,
            padding: EdgeInsets.fromLTRB(12, 150, 0, 0),
            child: Column(
              children: [
                Text(
                  username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container function() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.videocam_outlined,
                    color: Colors.red,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      padding: EdgeInsets.only(right: 20),
                      child: Text('Phát trực tiếp'))
                ],
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.image_outlined,
                  color: Colors.green,
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 1, color: Colors.grey)),
                    ),
                    padding: EdgeInsets.only(right: 20),
                    child: Text('Ảnh'))
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: const [
                  Icon(
                    Icons.video_call_outlined,
                    color: Colors.purple,
                  ),
                  Text('Phòng hop mặt')
                ],
              ),
            ),
            flex: 2,
          )
        ],
      ),
    );
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
                        'images/user/$imagesAvt',
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
            padding: EdgeInsets.fromLTRB(6, 8, 0, 6),
            child: Row(
              children: [
                Container(
                    width: 400,
                    child: new DescriptionTextWidget(text: description)),
              ],
            ),
          ),
          Image.asset('images/user/$images', width: 450, fit: BoxFit.cover),
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
                        child: Text(randomNumber.toString()),
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
                        icon: liked
                            ? Icon(Icons.thumb_up)
                            : Icon(Icons.thumb_up_alt_outlined),
                        color: liked ? Colors.blue : Colors.black,
                        onPressed: () {
                          liked = !liked;
                          randomNumber += (liked ? 1 : -1);
                          setState(() {});
                        },
                      ),
                      Text(
                        'Like',
                        style: TextStyle(
                          color: liked ? Colors.blue : Colors.black,
                        ),
                      )
                    ],
                  ),
                  flex: 1,
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
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child: Icon(Icons.reply)),
                      ),
                      Text('Share')
                    ],
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

  Container titleSection() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'images/user/avt.jpg',
                width: 40,
                height: 40,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: 'Bạn đang nghĩ gì?',
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf = "";
  String secondHalf = "";

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 70) {
      firstHalf = widget.text.substring(0, 70);
      secondHalf = widget.text.substring(70, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      // padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Column(
              children: <Widget>[new Text(firstHalf)],
            )
          : new Column(
              children: <Widget>[
                flag
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          new Text((firstHalf + "...")),
                        ],
                      )
                    : Column(
                        children: [
                          new Text((firstHalf + secondHalf)),
                        ],
                      ),
                new InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        flag ? "show more" : "show less",
                        style: new TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
