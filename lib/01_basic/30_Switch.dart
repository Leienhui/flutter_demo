import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CupertinoSwitch（ios风格的switch开关） Switch（安卓风格的switch开关）
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: SwitcchDemo(),
    );
  }
}

class SwitcchDemo extends StatefulWidget {
  const SwitcchDemo({Key? key}) : super(key: key);

  @override
  _SwitcchDemoState createState() => _SwitcchDemoState();
}

class _SwitcchDemoState extends State<SwitcchDemo> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            title: Text("当前的状态时${_switchValue == true ? "选中" : "未选中"}"),
            leading: Switch(
              value: _switchValue, //开关的值，一般与状态字段绑定
              onChanged: (bool val) {
                //开关状态发生变更的时候调用
                setState(() {
                  _switchValue = val;
                });
              },
              activeColor: Colors.orange, //开关开启时的圆圈颜色
              activeTrackColor: Colors.pink, //开关开启的时候轨道的颜色
              inactiveThumbColor: Colors.grey, //开关关闭时的圆圈颜色
              inactiveTrackColor: Colors.blue[100], //开关关闭的时候轨道的颜色
            ),
          ),
          ListTile(
            title: Text("Ios风格，当前的状态时${_switchValue == true ? "选中" : "未选中"}"),
            leading: CupertinoSwitch(
              value: _switchValue, //开关的值，一般与状态字段绑定
              onChanged: (bool val) {
                //开关状态发生变更的时候调用
                setState(() {
                  _switchValue = val;
                });
              },
              activeColor: Colors.orange[100], //开关开启时的轨道颜色
              trackColor: Colors.blueGrey[100], //开关关闭的时候轨道的颜色
              thumbColor: Colors.red, //圆圈颜色
            ),
          )
        ],
      ),
    );
  }
}
