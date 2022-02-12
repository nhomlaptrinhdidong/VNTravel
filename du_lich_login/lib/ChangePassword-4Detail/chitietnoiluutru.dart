import 'dart:ffi';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
String placeName_Text = "LOTTE HOTEL SAIGON";
String description_Text = "Đối diện sông Sài Gòn thơ mộng và chỉ mất 3- 5 phút đi bộ đến Nhà hát Lớn , đường Đồng Khởi và Lê Thánh Tôn. LOTTE HOTEL SAIGON là một trong những khách sạn 5 sao đầu tiên ở Sài Gòn, hiện nay khách sạn vẫn luôn giữ vững vị thế của mình trong suốt hơn hai thập niên qua. Với không gian hoàng gia sang trọng kết hợp ánh...";
String address = "4A Đ. Tôn Đức Thắng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam";
double pointOfHotel = 9.9;
String sdt = "0369999999";

class DetailHotel extends StatefulWidget {
  const DetailHotel({ Key? key }) : super(key: key);

  @override
  _DetailHotelState createState() => _DetailHotelState();
}

class _DetailHotelState extends State<DetailHotel> {
  final urlImages = [
  'https://www.lottehotel.com/content/dam/lotte-hotel/lotte/saigon/promotion/event/965-4-1440-evt-LTHO.jpg.thumb.768.768.jpg',
  'https://cf.bstatic.com/xdata/images/hotel/max1024x768/164127734.jpg?k=a6be7a3aa45bc63b1671b856a8c358ac53e2daa38ce059df99a11335fd122b9c&o=&hp=1',
  'https://www.lottehotel.com/content/dam/lotte-hotel/lotte/saigon/overview/introduction/180712-1-2000-ove-saigon-hotel.jpg.thumb.768.768.jpg'
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("$pointOfHotel/10",
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
            //Chi tiết
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Số điện thoại: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(sdt, style: TextStyle(color: Colors.red, fontSize: 20),)
                    ],
                  )
                ],
              ),
            ),
            //Địa chỉ
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