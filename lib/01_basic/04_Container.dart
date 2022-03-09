import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "text组件知识——Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。",
        style: TextStyle(fontSize: 20),
      ),
      padding: EdgeInsets.all(
          10.0), //EdgeInsets.all(设置四个方向的padding与margin)、EdgeInsets.fromLTRB(left, top, right, bottom)、EdgeInsets.only()某个方向
      margin: EdgeInsets.all(10.0),
      //修饰Container
      decoration: BoxDecoration(
        // border: Border.all(
        //     width: 10,color: Colors.lightBlue
        // ),
        //     borderRadius: BorderRadius.all(Radius.circular(10))
        border: Border(
            top: BorderSide(width: 10.0, color: Colors.redAccent),
            bottom: BorderSide(width: 10.0, color: Colors.redAccent),
            left: BorderSide(width: 10.0, color: Colors.redAccent),
            right: BorderSide(width: 10.0, color: Colors.redAccent)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
        ),
        color: Colors.greenAccent, //盒子背景色
        gradient: LinearGradient(//设置渐变后背景色失效
            colors: [Colors.lightBlue, Colors.white12]),
      ), //边框、圆角、渐变、阴影、背景色、背景图片。
      alignment: Alignment.topCenter, //内容对齐
      //变形(旋转、平移、缩放、斜切)
      // transform:Matrix4.rotationX(0),//旋转
      // transform:Matrix4.translationValues(10.0, 0.0, 0.0),//平移
      transform: Matrix4.skew(0, 10), //斜切
      width: double.infinity, //自适应手机的宽度
      height: double.infinity, //自适应手机的高度
    );
  }
}
