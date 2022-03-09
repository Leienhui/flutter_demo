import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: CheckBoxDemo(),
    );
  }
}

class CheckBoxDemo extends StatefulWidget {
  const CheckBoxDemo({Key? key}) : super(key: key);

  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _male = true;
  bool _female = false;
  bool _other = false;
  bool _value1 = true;
  bool _value2 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text("男"),
            leading: Checkbox(
              value: _male, //复选框的值，一般与状态字段绑定
              onChanged: (bool? val) {
                setState(() {
                  _male = val!;
                });
              },
              activeColor: Colors.orange[100], //选中时，复选框的背景颜色
              checkColor: Colors.lightBlue, //选中时，复选框中对号的颜色
            ),
          ),
          ListTile(
            title: Text("女"),
            leading: Checkbox(
              value: _female, //复选框的值，一般与状态字段绑定
              onChanged: (bool? val) {
                setState(() {
                  _female = val!;
                });
              },
              activeColor: Colors.orange[100], //选中时，复选框的背景颜色
              checkColor: Colors.lightBlue, //选中时，复选框中对号的颜色
            ),
          ),
          ListTile(
            title: Text("第三性别"),
            leading: Checkbox(
              value: _other, //复选框的值，一般与状态字段绑定
              onChanged: (bool? val) {
                setState(() {
                  _other = val!;
                });
              },
              activeColor: Colors.orange[100], //选中时，复选框的背景颜色
              checkColor: Colors.lightBlue, //选中时，复选框中对号的颜色
            ),
          ),
          CheckboxListTile(
            //可选中列表
            secondary: Icon(
              Icons.settings,
              size: 30,
            ), //左侧图标
            value: _value2,
            activeColor: Colors.orange[100], //选中时，复选框的背景颜色
            checkColor: Colors.lightBlue, //选中时，复选框中对号的颜色
            selected: _value2, //选中时整个列表添加背景，这个与上面activeColor一起用
            onChanged: (bool? val) {
              setState(() {
                _value2 = val!;
              });
            },
            title: Text("可选中标题列表"),
            subtitle: Text("二级标题"),
          ),
          CheckboxListTile(
            //可选中列表
            secondary: Icon(
              Icons.settings,
              size: 30,
            ), //左侧图标
            value: _value1,
            activeColor: Colors.orange[100], //选中时，复选框的背景颜色

            checkColor: Colors.lightBlue, //选中时，复选框中对号的颜色
            selected: _value1, //选中时整个列表添加背景，这个与上面activeColor一起用
            onChanged: (bool? val) {
              setState(() {
                _value1 = val!;
              });
            },
            title: Text("可选中标题列表"),
            subtitle: Text("二级标题"),
          ),
        ],
      ),
    );
  }
}
