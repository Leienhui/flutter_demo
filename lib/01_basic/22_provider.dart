// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //2.创建provider(注册数据模型)
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MyApp(),
    );
  }
}

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
//1.创建数据模型
class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  //返回私有内容，外部访问_count的时候只需要.count就可以了
  int get count => _count;

  void increment() {
    _count++;
    //  通知ui更新
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('点击次数:'),
          //count组件将从MyHomePage中重建
          Count(),
        ],
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //3.在子组件中使用数据模型
    return Column(children: [
      Text(
        //监控Counter数据模型中的_count
        '${context.watch<Counter>().count}',
      ),
      ElevatedButton(
        //通过静态方法获取Counter数据模型的方法（必须确保MyApp被MultiProvider包裹并指定数据模型才能点出来）
        onPressed: () => context.read<Counter>().increment(),
        child: const Icon(Icons.add),
      )
    ]);
  }
}
