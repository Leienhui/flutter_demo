import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("HelloWorld"),
        ),
        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("HomeBody build");
    return MyCounterWidget();
  }
}

class MyCounterWidget extends StatefulWidget {
  MyCounterWidget() {
    print("执行了MyCounterWidget的构造方法");
  }
  @override
  _MyCounterWidgetState createState() {
    print("执行了MyCounterWidget的createState方法"); // 将创建的State返回
    return _MyCounterWidgetState();
  }
}

class _MyCounterWidgetState extends State<MyCounterWidget> {
  int counter = 0;
  _MyCounterWidgetState() {
    print("执行_MyCounterState的构造方法");
  }
  @override
  void initState() {
    // 这里必须调用super,因为它有一个这样的注解@mustCallSuper
    super.initState();
    print("执行_MyCounterState的init方法");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("执行_MyCounterState的didChangeDependencies方法");
  }

  @override
  Widget build(BuildContext context) {
    print("执行执行_MyCounterState的build方法");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text(
                  "+1",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
              ),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                child: Text(
                  "-1",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
              )
            ],
          ),
          Text(
            "当前计数：$counter",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(MyCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("执行_MyCounterState的didUpdateWidget方法");
  }

  @override
  void dispose() {
    // 这里必须调用super,因为它有一个这样的注解@mustCallSuper
    super.dispose();
    print("执行_MyCounterState的dispose方法");
  }
}
