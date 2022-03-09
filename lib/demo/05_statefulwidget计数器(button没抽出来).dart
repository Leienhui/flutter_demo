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
        body: MyWidgetBody(),
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
  const MyWidgetBody({Key? key}) : super(key: key);

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
        Row(
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
        ),
        SizedBox(height: 8,),
        Text("当前计数为:$_value",style: style,),
      ],
    );
  }
}
