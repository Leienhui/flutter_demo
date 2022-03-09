import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _num = 0;
  @override
  void initState() {
    //初始化状态,通常根据后台接口的返回数据对状态进行初始化
    // TODO: implement initState
    super.initState();
    print('initState()');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('组件依赖改变：didChangeDependencies()');
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print('数据状态变化：setState()');
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('组件配置更新：didUpdateWidget()');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('暂时移除组件（切换页面等）：deactivate()');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('永久移除组件：dispose()');
  }

  @override
  Widget build(BuildContext context) {
    print('渲染组件：build()');
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('数字:$_num'),
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
              child: Text('-')),
        ],
      ),
    );
  }
}
