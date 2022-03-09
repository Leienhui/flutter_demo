import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _num = 0;
  @override
  Widget build(BuildContext context) {
    return ShareDataWidget(
      num: _num,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              //  跨组件访问
              child: MyCounter(),
            ),
            ElevatedButton(
                onPressed: () {
                  // 视图随数据变化需要调用setState
                  setState(() {
                    _num++;
                  });
                },
                child: Icon(Icons.add)),
            ElevatedButton(
              onPressed: () {
                // 视图随数据变化需要调用setState
                setState(() {
                  _num--;
                });
              },
              child: Text('-'),
            )
          ],
        ),
      ),
    );
  }
}

//状态组件
class MyCounter extends StatefulWidget {
  const MyCounter({Key? key}) : super(key: key);

  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).num.toString());
  }
}

//数据共享的组件
class ShareDataWidget extends InheritedWidget {
  final int num;
  const ShareDataWidget({Key? key, required Widget child, required this.num})
      : super(key: key, child: child);

  static ShareDataWidget of(BuildContext context) {
    final ShareDataWidget? result =
        context.dependOnInheritedWidgetOfExactType<ShareDataWidget>(); //获取具体的数据
    assert(result != null, 'No ShareDataWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //通知组件去更新
    return true;
  }
}
