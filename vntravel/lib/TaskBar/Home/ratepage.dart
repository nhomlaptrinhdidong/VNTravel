import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rate extends StatefulWidget {
  const Rate({Key? key}) : super(key: key);

  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  double rate = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Travel'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: const [
                              Text('Đánh giá: ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                              Text('5',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300))
                            ],
                          ),
                          RatingBar.builder(
                              minRating: 1,
                              itemBuilder: (context, _) =>
                                  const Icon(Icons.star, color: Colors.amber),
                              onRatingUpdate: (raiting) {
                                setState(() {
                                  rate = raiting;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(1.4),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Nhận xét', border: InputBorder.none),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            child: const Text('Gửi',
                                style: TextStyle(fontSize: 20)),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
