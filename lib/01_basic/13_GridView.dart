import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView(
        // gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount:3,//指定列数
        //   mainAxisSpacing: 20,//主轴方向的间距
        //   crossAxisSpacing: 20,//交叉轴方向上的间距
        //   childAspectRatio: 1.0,//子组件的宽高比例
        // ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0, //每列的宽度
          mainAxisSpacing: 20, //主轴方向的间距
          crossAxisSpacing: 20, //交叉轴方向上的间距
          childAspectRatio: 1.0, //子组件的宽高比例
        ),
        children: [
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
        ],
      ),
    );
  }
}
