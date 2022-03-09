import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: MyAppBar(),
        ),
        body: MyWidgetBody('我是传递信息'),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("我是appBar"));
  }
}

class MyWidgetBody extends StatefulWidget {
  final String message;
  MyWidgetBody(this.message);

  @override
  _MyWidgetBodyState createState() => _MyWidgetBodyState();
}

class _MyWidgetBodyState extends State<MyWidgetBody> {
  int _value = 0;
  final style=TextStyle(fontSize: 25);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _getButtons(),
        SizedBox(height: 8,),
        Text("当前计数为:$_value",style: style,),
        Text("${widget.message}",style: style,),//接受传递过来的数据
      ],
    );
  }

  Widget _getButtons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            child: Text('+',style: style,),
            onPressed: () {
              setState(() {
                _value++;
              });
            }),
        SizedBox(width: 8,),
        ElevatedButton(
            child: Text('-',style:style,),
            onPressed: () {
              setState(() {
                _value--;
              });
            }),
      ],
    );

  }
}
