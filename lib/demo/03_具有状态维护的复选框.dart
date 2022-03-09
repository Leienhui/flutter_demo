import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
//  1.调用runApp函数
//设置Text的排版方向
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  //子类必须重新父类的方法
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //返回要渲染的widget
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: MyWidgetBar()),
          body: MyCheckboxWidget(),
        ));
  }
}

//StatefulWidget不能定义状态，但是可以创建一个单独的类，负责维护状态
class MyCheckboxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //返回定义的状态类
    return CheckboxState();
  }
}

//定义一个状态类，保存状态
//因为State是一个泛型类，必须要指定一个继承自StatefulWidget的泛型类。
class CheckboxState extends State<MyCheckboxWidget> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
                value: this.value,
                onChanged: (value) {
                  //如果状态名和value属性不同命，就可以不加this
                  //视图发生变化，必须调用setState方法（与React一样）
                  setState(() {
                    this.value = value as bool;
                  });
                }),
            Text(
              "同意协议",
              style: TextStyle(fontSize: 30, color: Colors.orange),
            ),
          ],
        ));
  }
}

class MyWidgetBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('我是头部bar标题'),
    );
  }
}
