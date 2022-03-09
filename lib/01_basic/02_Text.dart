import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "text组件知识——Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 15,
            color: Colors.red,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.blue,
          ),
          textAlign: TextAlign.right,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1.5, //将文本放大1.5倍
        ),
        RichText(
            text: TextSpan(
                text: "hello",
                style: TextStyle(fontSize: 20, color: Colors.amber),
                children: [
              TextSpan(
                text: "哈哈哈",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )
            ]))
      ],
    );
  }
}
