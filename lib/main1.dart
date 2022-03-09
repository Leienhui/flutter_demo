import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//24之后的走这个main.dart(直接将本文件名改为main.dart,或者直接修改入口文件)
// import '01_basic/24_命名路由.dart';
// import '01_basic/25_动态路由.dart';
// import '01_basic/26_路由传参_匿名路由传参.dart';
// import '01_basic/26_路由传参_命名传参.dart';
// import '01_basic/27_Drawer导航.dart';
// import '01_basic/28_BottomNavigationBar导航.dart';
// import '01_basic/29_Tab导航.dart';
// import '01_basic/30_Switch.dart';
// import '01_basic/31_Checkbox.dart';
// import '01_basic/32_Radio.dart';
// import '01_basic/33_TextField.dart';
// import '01_basic/34_Calendar.dart';
// import '01_basic/35_Form.dart';
// import '01_basic/36_1_动画.dart';
// import '01_basic/36_2_交织动画.dart';
import '01_basic/36_3_hero动画.dart';
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '任务管理器中的标题',

      /****************************************命名路由（传参）
      //声明路由
      routes: {
        'home': (context) => Home(),
        'product': (context) => Product(),
        'productDetail':(context) => ProductDetail(),
      },
      initialRoute: 'home', //初始路由

      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => UnkownPage()), //未知页面都走这个路由

          // **********************************************/



    /****************************************动态路由

      //动态路由
      onGenerateRoute: (RouteSettings setting) {
        // print(setting.name);
        //  匹配首页
        if (setting.name == '/') {
          return MaterialPageRoute(builder: (context) => Home());
        }
        if (setting.name == 'product') {
          return MaterialPageRoute(builder: (context) => Product());
        }
        //匹配 product/:id
        //对路径进行解析
        // var uri=Uri.parse(setting.name as String);
        var uri = Uri.parse(setting.name!); //空安全判断
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'product') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => ProductDetail(id: id));
        }
        //返回未知页面
        return MaterialPageRoute(builder: (context) => UnkownPage());
      },
     **********************************************/




      home: Home(),
      theme: ThemeData(fontFamily: 'SourceSansPro'),
      debugShowCheckedModeBanner: false, //是否显示左上角调试标志
    );
  }
}
