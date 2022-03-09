import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  final List<String> _imageList = [
    'images/1.jpeg',
    'images/2.jpeg',
    'images/3.jpeg',
    'images/4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          height: 200,
          width: double.infinity,
          child: Swiper(
            itemCount: _imageList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _imageList[index],
                fit: BoxFit.cover, //填充方式
              );
            },
            pagination: SwiperPagination(), //添加小圆点（分页）
            control: SwiperControl(), //添加左右箭头导航
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          height: 200,
          width: double.infinity,
          child: Swiper(
            itemCount: _imageList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _imageList[index],
                fit: BoxFit.cover, //填充方式
              );
            },
            viewportFraction: 0.7, //主图的比例，1表示2占满整个屏幕
            scale: 0.7, //其他图片的比例
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          height: 200,
          width: double.infinity,
          child: Swiper(
            itemCount: _imageList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _imageList[index],
                fit: BoxFit.cover, //填充方式
              );
            },
            itemWidth: 300,
            layout: SwiperLayout.STACK, //指定一些具体的布局
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          height: 200,
          width: double.infinity,
          child: Swiper(
            itemCount: _imageList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _imageList[index],
                fit: BoxFit.cover, //填充方式
              );
            },
            itemWidth: 300,
            itemHeight: 200,
            layout: SwiperLayout.TINDER, //指定一些具体的布局
          ),
        ),
      ],
    );
  }
}
