import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonDemo();
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Wrap(
        children: [
          TextButton(
            onPressed: () => {print('点击了TextButton')},
            onLongPress: () => {print('长按TextButton')},
            child: Text('TextButton'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.amber),
            ),
          ),

          ElevatedButton(
              onPressed: () => {print('点击了ElevatedButton')},
              onLongPress: () => {print('长按ElevatedButton')},
              child: Text('ElevatedButton')),

          OutlinedButton(
            onPressed: () => {print('点击了OutlinedButton')},
            onLongPress: () => {print('长按OutlinedButton')},
            child: Text('OutlinedButton'),
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 30),
              ),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  //长按按钮设置字体颜色
                  return Colors.red;
                }
                return Colors.blue; //默认状态颜色为蓝色
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  //长按按钮设置背景为黄色
                  return Colors.yellow;
                }
                return Colors.white; //默认状态背景颜色为白色
              }),
              shadowColor:
                  MaterialStateProperty.all(Colors.purple[100]), //设置阴影颜色
              elevation: MaterialStateProperty.all(20), //设置阴影宽度
              side: MaterialStateProperty.all(
                //设置边框颜色及宽度
                BorderSide(color: Colors.purple, width: 4),
              ),
              //声明按钮形状
              shape: MaterialStateProperty.all(//设置圆角效果
                  StadiumBorder(
                      side: BorderSide(color: Colors.yellow, width: 4))),
              //  设置按钮大小
              minimumSize: MaterialStateProperty.all(
                Size(150, 60),
              ),
              //  设置水波纹颜色效果
              overlayColor: MaterialStateProperty.all(Colors.purple[100]),
            ),
          ),
          //  按钮主题样式设置
          OutlinedButtonTheme(
            //如果child中OutlinedButton的属性没设置，那么OutlinedButtonThemeData中的样式就生效，否则以OutlinedButton的属性为准
            data: OutlinedButtonThemeData(
                style: ButtonStyle(
              //  设置水波纹颜色效果
              overlayColor: MaterialStateProperty.all(Colors.purple[100]),
            )),
            child: OutlinedButton(
                child: Text('OutlinedButtonThemeData'),
                onPressed: () {
                  print('OutlinedButtonTheme被点击');
                },
                onLongPress: () {
                  print('OutlinedButtonTheme被长按');
                },
                style: ButtonStyle(
                  //  设置水波纹颜色效果
                  overlayColor: MaterialStateProperty.all(Colors.red[100]),
                )),
          ),
          //  图标按钮
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.accessibility_new_sharp),
            color: Colors.blue,
            splashColor: Colors.lightBlue, //设置水波纹（水波纹和高亮二者不可同时出现，以后写的为准）
            highlightColor: Colors.purple[100], //设置高亮颜色
            tooltip: '长按我了', //提示
          ),
          TextButton.icon(
            onPressed: () => {print('点击了TextButton.icon')},
            onLongPress: () => {print('长按TextButton.icon')},
            icon: Icon(Icons.add_alarm_sharp),
            label: Text('TextButton.icon'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.amber),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () => {print('点击了ElevatedButton.icon')},
            onLongPress: () => {print('长按ElevatedButton.icon')},
            icon: Icon(Icons.add_alarm_sharp),
            label: Text('ElevatedButton.icon'),
          ),
          OutlinedButton.icon(
            onPressed: () => {print('点击了OutlinedButton.icon')},
            onLongPress: () => {print('长按OutlinedButton.icon')},
            icon: Icon(Icons.add_alarm_sharp),
            label: Text('OutlinedButton.icon'),
          ),
          //  按钮组(默认水平排列，内容超出后垂直排列)
          Container(
            color: Colors.pink,
            width: double.infinity,
            child: ButtonBar(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('按钮1')),
                ElevatedButton(onPressed: () {}, child: Text('按钮2')),
                ElevatedButton(onPressed: () {}, child: Text('按钮3')),
                // ElevatedButton(onPressed: () {}, child: Text('按钮4')),
                // ElevatedButton(onPressed: () {}, child: Text('按钮5')),
                // ElevatedButton(onPressed: () {}, child: Text('按钮6')),
              ],
            ),
          ),
          BackButton(
            color: Colors.red,
            onPressed: () {
              print('BackButton被点击');
            },
          ),
          CloseButton(
            color: Colors.red,
            onPressed: () {
              print('CloseButton被点击');
            },
          ),
          FloatingActionButton(onPressed:(){
            print('FloatingActionButton被点击');
          },
           tooltip:'Increment',child:Icon(Icons.add),
            elevation: 0,//去掉阴影
          )
        ],
      ),
    );
  }
}
