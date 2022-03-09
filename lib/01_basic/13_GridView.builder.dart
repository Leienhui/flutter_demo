import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<dynamic> _list = [
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.blueGrey,
    ),
    Container(
      color: Colors.brown,
    ),
    Container(
      color: Colors.amberAccent,
    ),
    Container(
      color: Colors.deepPurpleAccent,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.blueGrey,
    ),
  ];
  // const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //指定列数
          mainAxisSpacing: 20, //主轴方向的间距
          crossAxisSpacing: 20, //交叉轴方向上的间距
          childAspectRatio: 1.0, //子组件的宽高比例
        ),
        itemBuilder: (context, index) {
          return _list[index];
        },
        itemCount: _list.length,
        physics:BouncingScrollPhysics(),//允许超出边界——反弹效果
        // physics:ClampingScrollPhysics(),//防止超出边界——夹住效果
        // physics: AlwaysScrollableScrollPhysics(),//始终响应滚动，默认滚动效果就是这个
        // physics:NeverScrollableScrollPhysics(),//不响应滚动
      ),
    );
  }
}
