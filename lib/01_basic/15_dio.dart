import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  void _getHttp() async {
    try {
      var response = await Dio()
          .get('https://github.com/flutterchina/dio/blob/master/README-ZH.md');
      print('请求成功');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          _getHttp();
        },
        child: Text('点我发起http请求'),
      ),
    );
  }
}
