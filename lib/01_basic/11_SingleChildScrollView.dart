import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        padding: EdgeInsets.all(10.0), //内边距
        child: Row(
          children: List.generate(
              50,
              (index) => OutlinedButton(
                    onPressed: () {},
                    child: Text('按钮$index'),
                  )),
        ), //子组件
        scrollDirection: Axis.horizontal, //滚动方向
        reverse: true, //初始滚动位置，false头部、true尾部
        //设置滚动特征
        physics: ClampingScrollPhysics(), //安卓下微光效果
        //   physics:BouncingScrollPhysics()//iOS下弹效果
      ),
      SingleChildScrollView(
          padding: EdgeInsets.all(60.0), //内边距
          child: Column(
              children: List.generate(
                  50,
                  (index) => OutlinedButton(
                        onPressed: () {},
                        child: Text('按钮$index'),
                      ))), //子组件
          scrollDirection: Axis.vertical, //动方向
          reverse: false, //初始滚动位置，false头部、true尾部
          //设置滚动特征
          // physics: ClampingScrollPhysics(),//安卓下微光效果
          physics: BouncingScrollPhysics() //iOS下弹效果
          ),
    ]);
  }
}
