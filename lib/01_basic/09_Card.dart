import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(30.0),
          color: Colors.yellow[100],
          shadowColor: Colors.purple[100],
          elevation: 20, //阴影高度
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), //边框圆角
              side: BorderSide(color: Colors.purple, width: 4) //边框颜色及粗细
              ),
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.ac_unit_sharp,
                  size: 50.0,
                  color: Colors.lightBlue,
                ), //头部组件
                title: Text(
                  '降雪',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                subtitle: Text(
                  '温度：-5~5',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(
                color: Colors.red,
              ), //分割线
              ListTile(
                title: Text('今天温差比较大，记得多穿点，地面结冰，路面滑，小心出行'),
              )
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.access_alarm_rounded,
                  size: 50.0,
                  color: Colors.lightBlue,
                ), //头部组件
                title: Text(
                  '星期一',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                subtitle: Text(
                  '日期：2021-12-27',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
