import 'dart:ffi';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
String placeName_Text = "BÁNH XÈO";
String description_Text = "Bánh xèo là một loại bánh phổ biến ở châu Á, phiên bản bánh xèo của Nhật Bản và Triều Tiên có bột bên ngoài, bên trong có nhân là tôm, thịt, giá đỗ, kim chi, khoai tây, hẹ, tôm, thịt, cải thảo được rán màu vàng, đúc thành hình tròn hoặc gấp lại thành hình bán nguyệt....";
String address = "4A Đ. Tôn Đức Thắng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam";
double pointOfHotel = 9.9;
String price = "20.000";

class DetailDish extends StatefulWidget {
  const DetailDish({ Key? key }) : super(key: key);

  @override
  _DetailDishState createState() => _DetailDishState();
}

class _DetailDishState extends State<DetailDish> {
  final urlImages = [
  'http://cdn.tgdd.vn/Files/2020/05/20/1256908/troi-mua-thu-lam-banh-xeo-kieu-mien-bac-gion-ngon-it-dau-mo-202005201034115966.jpg',
  'https://cdn.tgdd.vn/2020/07/CookProduct/Untitled-2-1200x676-3.jpg',
  'https://1.bp.blogspot.com/-KDESzRbUpAg/XfmGLUR3RBI/AAAAAAAAAS8/v2f9TGWyYw4ica4KFmLVaptc8rw3WY2ZwCEwYBhgL/s640/banh-xeo-3.jpg'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
              Center(
                child: CarouselSlider.builder(
                  itemCount: urlImages.length,
                   itemBuilder: (context, index, realIndex) {
                     final urlImage = urlImages[index];

                     return buildImage(urlImage, index);
                   },
                    options: CarouselOptions(
                      height: 400,
                      autoPlay: true,
                      //reverse: true,
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      enlargeCenterPage: true,
                      )
                    ),
              ),
            //Tên địa danh
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(placeName_Text, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),),
                ),
                //Điểm đánh giá
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 20),
                //       child: Text("$pointOfHotel/10",
                //       style: const TextStyle(
                //         color: Colors.red,
                //         fontWeight: FontWeight.normal,
                //         fontSize: 20
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                
              ],
            ),
            //Mô tả
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(description_Text, textAlign: TextAlign.justify),
            ),
            //Chi tiết
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Giá: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(price, style: TextStyle(color: Colors.red, fontSize: 20),)
                    ],
                  )
                ],
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 12),
    color: Colors.grey,
    child: Image.network(
      urlImage,
      fit: BoxFit.cover,
    ),
  );
}