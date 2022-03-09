import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: RadioDemo(),
    );
  }
}

class RadioDemo extends StatefulWidget {
  const RadioDemo({Key? key}) : super(key: key);

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _gender = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 1, //单选框的值
                onChanged: (int? value) {
                  setState(() {
                    _gender = value!;
                  });
                }, //状态变更时调用
                groupValue: _gender, //选择组的值
                activeColor: Colors.orange[100], //选中时背景颜色
              ),
              Text("男"),
              Radio(
                value: 2, //单选框的值
                onChanged: (int? value) {
                  setState(() {
                    _gender = value!;
                  });
                }, //状态变更时调用
                groupValue: _gender, //选择组的值
                activeColor: Colors.orange[100], //选中时背景颜色
              ),
              Text("女"),
              Radio(
                value: 3, //单选框的值
                onChanged: (int? value) {
                  setState(() {
                    _gender = value!;
                  });
                }, //状态变更时调用
                groupValue: _gender, //选择组的值
                activeColor: Colors.orange[100], //选中时背景颜色
              ),
              Text("变性人"),
            ],
          ),
          //单选列表
          RadioListTile(
            secondary: Icon(
              Icons.person,
              size: 30,
            ), //右侧图标
            title: Text("男，这个value等于1"),
            subtitle: Text("二级标题"),
            value: 1, //单选框的值
            onChanged: (int? value) {
              setState(() {
                _gender = value!;
              });
            }, //状态变更时调用
            groupValue: _gender, //选择组的值
            activeColor: Colors.orange[100], //选中时背景颜色
            selected: _gender == 1 ? true : false,
          ),
          //单选列表
          RadioListTile(
            secondary: Icon(
              Icons.person,
              size: 30,
            ), //左侧图标
            title: Text("女，这个value等于2"),
            subtitle: Text("二级标题"),
            value: 2, //单选框的值
            onChanged: (int? value) {
              setState(() {
                _gender = value!;
              });
            }, //状态变更时调用
            groupValue: _gender, //选择组的值
            activeColor: Colors.orange[100], //选中时背景颜色
            selected: _gender == 2 ? true : false,
          ),
          //单选列表
          RadioListTile(
            secondary: Icon(
              Icons.person,
              size: 30,
            ), //左侧图标
            title: Text("变性人，这个value等于3"),
            subtitle: Text("二级标题"),
            value: 3, //单选框的值
            onChanged: (int? value) {
              setState(() {
                _gender = value!;
              });
            }, //状态变更时调用
            groupValue: _gender, //选择组的值
            activeColor: Colors.orange[100], //选中时背景颜色
            selected: _gender == 3 ? true : false,
          ),
        ],
      ),
    );
  }
}
