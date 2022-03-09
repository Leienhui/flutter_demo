import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//引入Hello.dart
// import '01_basic/01_Hello.dart';
// import '01_basic/02_Text.dart';
// import '01_basic/03_颜色.dart';
// import '01_basic/04_Container.dart';
// import '01_basic/05_线性布局.dart';
// import '01_basic/06_弹性布局.dart';
// import '01_basic/07_流式布局.dart';
// import '01_basic/08_层叠布局.dart';
// import '01_basic/09_Card.dart';
// import '01_basic/10_按钮.dart';
// import '01_basic/11_SingleChildScrollView.dart';
// import '01_basic/12_ListView.dart';
// import '01_basic/13_GridView.dart';
// import '01_basic/13_GridView匿名构造函数（语法糖）.dart';
// import '01_basic/13_GridView.builder.dart';
// import '01_basic/14_Cupertino.dart';
// import '01_basic/15_dio.dart';
// import '01_basic/16_flutter_swiper.dart';
// import '01_basic/17_shared_preferences.dart';
// import '01_basic/18_StatefulWidget.dart';
// import '01_basic/19_DataTable.dart';
// import '01_basic/20_InheritedWidget.dart';
// import '01_basic/21_生命周期.dart';
// import '01_basic/22_provider.dart';
import '01_basic/23_匿名路由.dart';
//24之前的走这个main.dart(直接将本文件名改为main.dart，或者直接修改入口文件)
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '任务管理器中的标题',
      home: Scaffold(
        appBar: AppBar(
          title: Text('我是appbar'),
          centerTitle: true,
        ),
        body: Home(),
        //声明路由

        // floatingActionButton:FloatingActionButton(onPressed: (){},tooltip:'Increment',child:Icon(Icons.add)),
      ),
      theme: ThemeData(fontFamily: 'SourceSansPro'),
      debugShowCheckedModeBanner: false, //是否显示左上角调试标志
    );
  }
}
