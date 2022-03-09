import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io'; //判断是在安卓平台还是Ios平台的核心库

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _dialogBox = IosDemo();
    //判断当前的平台信息
    if (Platform.isIOS) {
      //  ios风格
      _dialogBox = IosDemo();
    } else if (Platform.isAndroid) {
      //  安卓风格
      _dialogBox = AndroidDemo();
    }
    return Container(
      child: Column(
        children: [_dialogBox],
      ),
    );
  }
}

class AndroidDemo extends StatelessWidget {
  const AndroidDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text('AlertDialog安卓风格'),
        content: Text('确认删除吗'),
        actions: [
          TextButton(onPressed: () {}, child: Text('取消')),
          TextButton(onPressed: () {}, child: Text('确认'))
        ],
      ),
    );
  }
}

class IosDemo extends StatelessWidget {
  const IosDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoAlertDialog(
        title: Text('CupertinoAlertDialog Ios风格'),
        content: Text('确认删除吗'),
        actions: [
          CupertinoDialogAction(onPressed: () {}, child: Text('取消')),
          CupertinoDialogAction(onPressed: () {}, child: Text('确认'))
        ],
      ),
    );
  }
}
