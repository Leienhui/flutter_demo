
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyHomeBody());
}

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: ,
        body: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "《定风波》",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              TextSpan(
                  text: "苏轼",
                  style: TextStyle(fontSize: 18, color: Colors.redAccent)),
              TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。")
            ],
          ),
          style: TextStyle(fontSize: 20, color: Colors.purple),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}