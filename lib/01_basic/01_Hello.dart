import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //home是主内容
      appBar: AppBar(
        leading: Icon(Icons.menu), //左侧显示出的菜单
        title: Text("首页"), //应用头部名称
        actions: [Icon(Icons.settings), Icon(Icons.seventeen_mp_sharp)], //右侧菜单
        elevation: 0.0, //去掉头部阴影
        centerTitle: true, //将title居中
      ), //应用头部
      body: HelloFlutter(), //应用主体
      // floatingActionButton:,//浮动按钮
      // drawer: ,//左侧抽屉菜单
      // endDrawer: ,//右侧抽屉菜单
      // bottomNavigationBar: ,
    );
  }
}

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello",
    );
  }
}
