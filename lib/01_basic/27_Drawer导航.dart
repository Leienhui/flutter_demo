import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
      body: HomePage(),
      drawer: DrawerList(), //左侧抽屉菜单
      endDrawer: DrawerList(), //右侧抽屉菜单
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Home'),
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0), //将边距设为0就能将图片覆盖状态栏
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('陈毅'),
            accountEmail: Text('chenyi@126.com'),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/1.jpeg"),
                fit: BoxFit.cover, //整个图片填充
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/3.jpeg"),
            ), //当前账号的图片
          ), //抽屉菜单的头部
          ListTile(
            leading: Icon(Icons.settings), //左边的图标
            title: Text('设置'),
            trailing: Icon(Icons.arrow_forward_ios), //右侧图标
          ),
          Divider(
            thickness: 2,
          ), //分割线
          ListTile(
            leading: Icon(Icons.settings), //左边的图标
            title: Text('说明'),
            trailing: Icon(Icons.arrow_forward_ios), //右侧图标
          ),
          Divider(
            thickness: 2,
          ), //分割线
          ListTile(
            leading: Icon(Icons.settings), //左边的图标
            title: Text('回退'),
            onTap: () => Navigator.pop(context), //单击执行的逻辑
            trailing: Icon(Icons.arrow_forward_ios), //右侧图标
          ),
          Divider(
            thickness: 2,
          ), //分割线
          //弹出层
          AboutListTile(
            child: Text('关于'), //关于软件的说明
            applicationName: 'flutter应用', //应用名称
            applicationVersion: ' 1.0.0', //版本号
            icon: CircleAvatar(
              //图标
              child: Text('flutter'),
            ),
            applicationLegalese: "应用法律条例",
            aboutBoxChildren: [
              Text("条例1:xxxxx"),
              Text("条例2"),
              Text("条例3"),
              Text("条例4"),
              Text("条例5"),
            ],
            applicationIcon: Image.asset(
              "images/3.jpeg",
              //  设置尺寸
              width: 50,
              height: 50,
            ), //当前应用图标
          )
        ],
      ),
    );
  }
}
