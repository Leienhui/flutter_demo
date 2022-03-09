import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //定义导航菜单列表
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      backgroundColor: Colors.blue,
      label: "首页",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      backgroundColor: Colors.green,
      label: "消息",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      backgroundColor: Colors.amber,
      label: "购物车",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      backgroundColor: Colors.red,
      label: "个人中心",
    ),
  ];
  //定义页面列表
  final List<Widget> pages = [
    Center(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        "Message",
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        "Cart",
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        "Person",
        style: TextStyle(fontSize: 50),
      ),
    ),
  ];
  //当前导航索引
  late int currentIndex;
  @override
  void initState() {
    //设置默认状态的
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu), //左侧显示出的菜单
        title: Text("首页"), //应用头部名称
        actions: [Icon(Icons.settings)], //右侧菜单
        elevation: 0.0, //去掉头部阴影
        centerTitle: true, //将title居中
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems, //包含导航（BottomNavigationBarItems）的列表
        currentIndex: currentIndex, //当前导航索引
        type: BottomNavigationBarType.fixed, //导航类型（声明底部导航样式），
        // type: BottomNavigationBarType.shifting,
        onTap: (index) {
          _changePage(index);
        }, //导航的点击事件，一般会更新导航索引
      ),
    );
  }

  //改变页面索引从而改变页面
  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
