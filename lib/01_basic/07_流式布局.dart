import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  List<String> _list = [
    '和平区',
    '南开',
    '朝阳',
    '东丽',
    '滨海',
    '望京',
    '贵阳',
    '六盘水',
  ];
  List<Widget> _shiqu() {
    //遍历后得到的是一个可迭代的列表(并不是列表)，需要获取列表需要使用toList()
    return _list
        .map((e) => Chip(
              label: Text(e),
              avatar: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Text(e),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: _shiqu(),
          spacing: 18.0, //水平方向间距
          runSpacing: 30, //垂直方向的间距
          // alignment: WrapAlignment.spaceAround,//主轴方向的对齐方式
          // runAlignment:WrapAlignment.spaceAround,//交叉轴方向的对齐方式
        )
      ],
    );
  }
}
