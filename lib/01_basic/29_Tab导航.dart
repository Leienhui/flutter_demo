import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  //菜单数组
  final List<Widget> _tabs = [
    Tab(
      text: "首页",
      icon: Icon(Icons.home),
    ),
    Tab(
      text: "添加",
      icon: Icon(Icons.add),
    ),
    Tab(
      text: "搜索",
      icon: Icon(Icons.search),
    ),
    Tab(
      text: "时间",
      icon: Icon(Icons.add_alarm_sharp),
    ),
  ];
  //页面数组
  final List<Widget> _tabViews = [
    Center(
      child: Text(
        "首页",
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        "添加",
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        "搜索",
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        "时间",
        style: TextStyle(fontSize: 50),
      ),
    ),
  ];
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //DefaultTabController：整个Tab导航的容器
    return DefaultTabController(
      length: _tabs.length, //导航数量
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu), //左侧显示出的菜单
          title: Text("首页"), //应用头部名称
          actions: [Icon(Icons.settings)], //右侧菜单
          elevation: 0.0, //去掉头部阴影
          centerTitle: true, //将title居中
          // TabBar：导航菜单
          bottom: TabBar(
            tabs: _tabs, //导航菜单数组
            labelColor: Colors.yellow, //设置菜单颜色
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab, //设置导航横线的大小
            indicatorColor: Colors.yellow,
            indicatorWeight: 5,
          ),
        ),
        //TabBarView：导航页面
        body: TabBarView(
          children: _tabViews, //多个导航页面内容
        ),

        bottomNavigationBar: TabBar(
          tabs: _tabs,
          labelColor: Colors.blue, //设置菜单颜色
          unselectedLabelColor: Colors.black, //未选中菜单的颜色
        ),
      ),
    );
  }
}
