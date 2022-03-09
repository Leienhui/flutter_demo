import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Colors颜色的使用",
          style: TextStyle(color: Colors.blue[200]),
        ),
        Text(
          "fromARGB",
          style: TextStyle(color: Color.fromARGB(0xFF, 0x00, 0xFF, 0x00)),
        ), //（0-255也行）
        Text("fromRGBO",
            style: TextStyle(
                color: Color.fromRGBO(0x00, 0xFF, 0x00, 0.8))), //（0-255也行）
      ],
    );
  }
}
