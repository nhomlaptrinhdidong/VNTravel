import 'dart:ffi';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
String placeName_Text = "EON 51";
String description_Text = "Đây là nhà hàng 5s cao cấp .Nếu bạn muốn được tận hưởng nền ẩm thực Châu Âu từ truyền thống cho đến sự giao hòa, kết hợp đầy sáng tạo thì đừng chần chờ gì mà không ghé ngay đến EON 51. Là một trong những điểm đến lý tưởng của Tp. Hồ Chí Minh, nơi đây sẽ dành cho bạn những món ăn với chất lượng đỉnh cao, một không gian làm say lòng người và thêm nữa chính là đội ngũ nhân viên đầy nhiệt huyết, mang đến cho tất cả quý khách hàng những dịch vụ tốt nhất!";
String address = "Tầng 51, Bitexco Financial Tower, 2 Hải Triều, Quận 1, TPHCM Thành phố Hồ Chí Minh 70000";
double pointOfRestaurant = 9.9;

class DetailRestaurant extends StatefulWidget {
  const DetailRestaurant({ Key? key }) : super(key: key);

  @override
  _DetailRestaurantState createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurant> {
  final urlImages = [
  'https://pastaxi-manager.onepas.vn/content/uploads/articles/minhnguyet/eon-51/nha-hang-eon-51-7.jpg',
  'https://pastaxi-manager.onepas.vn/content/uploads/articles/minhnguyet/eon-51/nha-hang-eon-51-6.jpg',
  'https://api.thue.today/uploads/brand/1533789968_34588815_755977404605748_1879301182753603584_o.jpg'
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(placeName_Text, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),),
                ),
                //Điểm đánh giá
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("$pointOfRestaurant/10",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.normal,
                        fontSize: 20
                        ),
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
            //Mô tả
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(description_Text, textAlign: TextAlign.justify),
            ),
            
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.all(Radius.circular(10)),),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text('Địa chỉ: ', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300),),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(address.toString()),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 80,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //   color: Colors.blue[400],
                    //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(10),
                    //     child: Text(slogan_Text,
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
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