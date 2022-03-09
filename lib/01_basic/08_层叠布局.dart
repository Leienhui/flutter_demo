import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        textDirection: TextDirection.ltr, //声明未定位子组件的排序方式
        alignment: AlignmentDirectional.bottomCenter, //声明未定位子组件的对齐方式
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://c-ssl.duitang.com/uploads/item/201712/08/20171208214551_AFQ2h.thumb.1000_0.jpeg',
            ),
            radius: 200,
          ),
          Positioned(
            child: Container(
              child: Text(
                '这个是一个定位组件',
                style: TextStyle(color: Colors.red),
              ),
            ),
            top: 300,
            left: 200,
          ),
          Text(
            '这是一个未定义组件',
            style: TextStyle(fontSize: 30, color: Colors.lightBlue),
          )
        ],
      ),
    );
  }
}
