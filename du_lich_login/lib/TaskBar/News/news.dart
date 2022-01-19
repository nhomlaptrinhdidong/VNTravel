import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

Random random = Random();
int randomNumber = random.nextInt(100);

class _NewsScreenState extends State<NewsScreen> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    const String description =
        "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

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

  SizedBox listStory() {
    return SizedBox(
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
      margin: const EdgeInsets.all(7),
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
            margin: const EdgeInsets.fromLTRB(12, 12, 0, 0),
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
            padding: const EdgeInsets.fromLTRB(12, 150, 0, 0),
            child: Column(
              children: [
                Text(
                  username,
                  style: const TextStyle(
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
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.videocam_outlined,
                    color: Colors.red,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      padding: const EdgeInsets.only(right: 20),
                      child: const Text('Phát trực tiếp'))
                ],
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.image_outlined,
                  color: Colors.green,
                ),
                Container(
                    decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 1, color: Colors.grey)),
                    ),
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text('Ảnh'))
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 30),
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
            offset: const Offset(0, 3), // changes position of shadow
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
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8),
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
            padding: const EdgeInsets.fromLTRB(6, 8, 0, 6),
            child: Row(
              children: [
                SizedBox(
                    width: 360,
                    child: DescriptionTextWidget(text: description)),
              ],
            ),
          ),
          Image.asset('images/user/$images', width: 450, fit: BoxFit.cover),
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
            ),
            padding: const EdgeInsets.fromLTRB(20, 30, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.thumb_up,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                      const CircleAvatar(
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
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Text('645 bình luận • 490 lượt chia sẻ'),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 12),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        icon: liked
                            ? const Icon(Icons.thumb_up)
                            : const Icon(Icons.thumb_up_alt_outlined),
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
                        icon: const Icon(Icons.messenger_outline),
                      ),
                      const Text('Comment')
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
                            child: const Icon(Icons.reply)),
                      ),
                      const Text('Share')
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
      decoration: const BoxDecoration(
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: 'Bạn đang nghĩ gì?',
                    isDense: true,
                    contentPadding: const EdgeInsets.all(12),
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

  // ignore: use_key_in_widget_constructors
  const DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf = "";
  String secondHalf = "";

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 40) {
      firstHalf = widget.text.substring(0, 40);
      secondHalf = widget.text.substring(40, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Column(
              children: <Widget>[Text(firstHalf)],
            )
          : Column(
              children: <Widget>[
                flag
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text((firstHalf + "...")),
                        ],
                      )
                    : Column(
                        children: [
                          Text((firstHalf + secondHalf)),
                        ],
                      ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        flag ? "show more" : "show less",
                        style: const TextStyle(color: Colors.grey),
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
