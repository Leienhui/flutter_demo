import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            //默认宽高为0
            color: Colors.lightBlue,
            width: 50,
            height: 50,
          ),
          Expanded(
              //默认宽高为父元素宽度
              child: Container(
            color: Colors.greenAccent,
            height: 50,
          )),
        ],
      ),
      Text('弹性布局'),
      Flex(
        direction: Axis.horizontal,
        textDirection: TextDirection.rtl, //排列方式
        children: [
          Icon(
            Icons.access_alarm,
            size: 30,
          ),
          Icon(
            Icons.access_alarm,
            size: 30,
          ),
          Icon(
            Icons.access_alarm,
            size: 30,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
      Text('Flex与Expanded混合'),
      Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            //默认宽高为父元素宽度,但是在Flex组件中失效
            child: Container(
              color: Colors.amber,
              height: 50,
            ),
            flex: 1,
          ),
          Expanded(
            //默认宽高为父元素宽度,但是在Flex组件中失效
            child: Container(
              color: Colors.greenAccent,
              height: 50,
            ),
            flex: 2,
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: 100,
          color: Colors.black12,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                //默认宽高为父元素宽度,但是在Flex组件中失效
                child: Container(
                  color: Colors.amber,
                  height: 50,
                ),
                flex: 1,
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                //默认宽高为父元素宽度,但是在Flex组件中失效
                child: Container(
                  color: Colors.greenAccent,
                  height: 50,
                ),
                flex: 2,
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
