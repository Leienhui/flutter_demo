import 'dart:math';

import 'package:flutter/material.dart';
import '36_3_1_ImageDetail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: HeroAnimation(),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView.extent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        children: List.generate(20, (index) {
          String imageURL =
              "https://picsum.photos/id/${index}/300/400"; //自动生成图片的网址
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) {
                return ImageDetail(imageURL);
              }));
            },
            child: Hero(
              tag: imageURL,
              child: Image.network(imageURL),
            ),
          ); //手势的识别
        }),
      ),
    );
  }
}
