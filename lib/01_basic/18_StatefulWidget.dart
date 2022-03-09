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
              child: Icon(Icons.add))
        ],
      ),
    );
  }
}
