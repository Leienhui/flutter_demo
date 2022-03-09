import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
//  1.调用runApp函数
//设置Text的排版方向
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  //子类必须重新父类的方法
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //返回要渲染的widget
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: MyWidgetBar()),
          body: MyWidgetBody(),
        ));
  }
}

class MyWidgetBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "hello world",
        style: TextStyle(fontSize: 30, color: Colors.orange),
      ),
    );
  }
}

class MyWidgetBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('我是头部bar标题'),
    );
  }
}
