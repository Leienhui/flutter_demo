import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  _incrementCounter() async {
    //获取保存实例
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('点击了 $counter 次.');
    //将数据保存到本地缓存
    await prefs.setInt('counter', counter);
  }

  _decrementCounter() async {
    //获取保存实例
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int counter = prefs.getInt('counter') ?? 0;
    if (counter > 0) {
      counter--;
    }
    print('点击了 $counter 次.');
    //将数据保存到本地缓存
    await prefs.setInt('counter', counter);
  }

  _removeCounter() async {
    //获取保存实例
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //将数据移除
    // await prefs.remove('counter');
    //将数据移除
    await prefs.clear();
    int counter = prefs.getInt('counter') ?? 0;
    print('点击了 $counter 次.');
  }

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        ElevatedButton(
          child: Text('递增'),
          onPressed: () {
            _incrementCounter();
          },
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          child: Text('递减'),
          onPressed: () {
            _decrementCounter();
          },
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          child: Text('删除'),
          onPressed: () {
            _removeCounter();
          },
        ),
      ]),
    );
  }
}
