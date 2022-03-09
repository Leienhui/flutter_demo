#   widget的使用

# [书本](https://book.flutterchina.club/)

## App结构

* `main.dart`文件中

```dart

import 'package:flutter/cupertino.dart';//ios风格的组件
import 'package:flutter/material.dart';//安卓风格的组件
//引入对应组件
import '01_basic/01_Hello.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '任务管理器中的标题',
      home:Home(),
      debugShowCheckedModeBanner:false ,//是否显示左上角调试标志
    );
  }
}
```

* `01_Hello.dart`文件中

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //home是主内容
      appBar: AppBar(
        leading: Icon(Icons.menu), //左侧显示出的菜单
        title: Text("首页"), //应用头部名称
        actions: [Icon(Icons.settings), Icon(Icons.seventeen_mp_sharp)], //右侧菜单
        elevation: 0.0, //去掉头部阴影
        centerTitle: true, //将title居中
      ), //应用头部
      body: HelloFlutter(), //应用主体
      // floatingActionButton:,//浮动按钮
      // drawer: ,//左侧抽屉菜单
      // endDrawer: ,//右侧抽屉菜单
      // bottomNavigationBar: ,
    );
  }
}

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello",
    );
  }
}

```



![](./img\Scaffold脚手架.png)

# 基础Widget

## 文本组件

```dart
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

```

## 设置自定义字体

1.下载字体文字并在flutter项目根目录下新建一个文件夹fonts,将下载下来的文件解压放到这个文件中

2.在pubspec.yaml中声明字体

​	找到` flutter:`

```c

    fonts:
      - family:SourceSansPro//TextStyle的fontFamily属性中用到的名字
      fonts://该路径相对于flutter项目的根路径
        _ asset:fonts/Source_Sans_Pro/SourceSansPro-Black.ttf
        _ asset:fonts/Source_Sans_Pro/SourceSansPro-BlackItalic.ttf
        weigt:400
        style:normal
```

3.使用：

* 全局使用

  ```dart
  MaterialApp(
        theme: ThemeData(fontFamily: 'SourceSansPro'),
      );
  ```

  

* 局部组件使用`fontFamily: 'SourceSansPro'`

  

## Color(自定义颜色)



```dart
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

```



## Container

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "text组件知识——Flutter是谷歌  的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。",
        style: TextStyle(fontSize: 20),
      ),
      padding: EdgeInsets.all(
          10.0), //EdgeInsets.all(设置四个方向的padding与margin)、EdgeInsets.fromLTRB(left, top, right, bottom)、EdgeInsets.only()某个方向
      margin: EdgeInsets.all(10.0),
      //修饰Container
      decoration: BoxDecoration(
        // border: Border.all(
        //     width: 10,color: Colors.lightBlue
        // ),
        //     borderRadius: BorderRadius.all(Radius.circular(10))
        border: Border(
            top: BorderSide(width: 10.0, color: Colors.redAccent),
            bottom: BorderSide(width: 10.0, color: Colors.redAccent),
            left: BorderSide(width: 10.0, color: Colors.redAccent),
            right: BorderSide(width: 10.0, color: Colors.redAccent)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
        ),
        color: Colors.greenAccent, //盒子背景色
        gradient: LinearGradient(//设置渐变后背景色失效
            colors: [Colors.lightBlue, Colors.white12]),
      ), //边框、圆角、渐变、阴影、背景色、背景图片。
      alignment: Alignment.topCenter, //内容对齐
      //变形(旋转、平移、缩放、斜切)
      // transform:Matrix4.rotationX(0),//旋转
      // transform:Matrix4.translationValues(10.0, 0.0, 0.0),//平移
      transform: Matrix4.skew(0, 10), //斜切
      width: double.infinity, //自适应手机的宽度
      height: double.infinity, //自适应手机的高度
    );
  }
}

```

## 线性布局

* Column
  * 主轴方向为垂直方向
* Row
  * 主轴方向为水平方向

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Column中的Row'),
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
          ),
          Text('column'),
          Icon(Icons.access_alarm_outlined),
          Icon(Icons.access_alarm_outlined),
          Icon(Icons.access_alarm_outlined),
          Icon(Icons.access_alarm_outlined),
        ],
      ),
    );
  }
}

```

## 弹性布局(flex)

* flex
* Expanded(可伸缩组件)
  * flex:声明弹性布局所占比例

```dart
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

```



## 流式布局

作用：解决内容溢出问题

* Wrap（解决内容溢出问题）
  * spacing（主轴方向子组件的间距）
  * alignment（主轴方向的对齐方式）
  * runSpacing（交叉轴方向子组件的间距）
  * runAlingnment（交叉轴方向的对齐方式）
* 以下组件不属于流式布局

* Chip：标签
* CircleAvatar：圆形头像

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  List<String> _list = [
    '和平区',
    '南开',
    '朝阳',
    '东丽',
    '滨海',
    '望京',
    '贵阳',
    '六盘水',
  ];
  List<Widget> _shiqu() {
    //遍历后得到的是一个可迭代的列表(并不是列表)，需要获取列表需要使用toList()
    return _list
        .map((e) => Chip(
              label: Text(e),
              avatar: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Text(e),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: _shiqu(),
          spacing: 18.0, //水平方向间距
          runSpacing: 30, //垂直方向的间距
          // alignment: WrapAlignment.spaceAround,//主轴方向的对齐方式
          // runAlignment:WrapAlignment.spaceAround,//交叉轴方向的对齐方式
        )
      ],
    );
  }
}

```

## 层叠式布局

* Stack:层叠组件，类似于css中的z-index
  * alignment：声明未定位子组件的对齐方式
  * textDirection:声明未定位子组件的排序方式
* Positioned:绝对定位组件
  * child:声明子组件
  * left、top、bottom、right:声明绝对定位的具体方向
  * width、height

以下组件不属于层叠式布局

* NetworkImage(网络图片组件)
  * NetworkImage('图片地址')

* 允许应用访问网络权限配置（根目录下/app/src/main/AndroidManifest.xml文件中的manifest标签**中**输入下面的标签）
  * `<uses-permission android:name="android.permission.INTERNET"/>`
* 如果网络图片的协议是http，需要在 根目录下/app/src/main/AndroidManifest.xml文件中的application标签**上**输入
  * ` android:usesCleartextTraffic="true"`
* 配置完毕后需要重启模拟器

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        textDirection: TextDirection.ltr, //声明未定位子组件的排序方式
        alignment: AlignmentDirectional.bottomCenter, //声明未定位子组件的对齐方式
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://c-ssl.duitang.com/uploads/item/201712/08/20171208214551_AFQ2h.thumb.1000_0.jpeg',
            ),
            radius: 200,
          ),
          Positioned(
            child: Container(
              child: Text(
                '这个是一个定位组件',
                style: TextStyle(color: Colors.red),
              ),
            ),
            top: 300,
            left: 200,
          ),
          Text(
            '这是一个未定义组件',
            style: TextStyle(fontSize: 30, color: Colors.lightBlue),
          )
        ],
      ),
    );
  }
}
```

## Card与ListTile(列表瓦片)

### Card

* child:子组件
* color:背景颜色
* shadowColor:阴影色
* elevation:阴影高度
* shape:边框样式
* margin：外边距

### ListTile

* 声明列表中一个元素布局的组件
* leading：头部组件（一般用于设置图标或者图片）
* title:标题
* subtitle子标题

```
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(30.0),
          color: Colors.yellow[100],
          shadowColor: Colors.purple[100],
          elevation: 20, //阴影高度
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), //边框圆角
              side: BorderSide(color: Colors.purple, width: 4) //边框颜色及粗细
              ),
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.ac_unit_sharp,
                  size: 50.0,
                  color: Colors.lightBlue,
                ), //头部组件
                title: Text(
                  '降雪',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                subtitle: Text(
                  '温度：-5~5',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(
                color: Colors.red,
              ), //分割线
              ListTile(
                title: Text('今天温差比较大，记得多穿点，地面结冰，路面滑，小心出行'),
              )
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.access_alarm_rounded,
                  size: 50.0,
                  color: Colors.lightBlue,
                ), //头部组件
                title: Text(
                  '星期一',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                subtitle: Text(
                  '日期：2021-12-27',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
```

## 按钮

* flutter 1.22之前
  * FlatButton(扁平按钮)
  * RaiseButton(凸起按钮)
  * OutlineButton(轮廓按钮)
* flutter 1.22之后
  * TextButton(文本按钮)————替换FlatButton
  * ElevatedButton(凸起按钮)————替换RaiseButton
  * OutlinedButton(轮廓按钮)————替换OutlineButton
  * IconButton(图标按钮)
  * BackButton（返回按钮）
  * ButtonBar（按钮组，默认水平排列，内容超出后垂直排列）
  * TextButton.icon(文本图标按钮)
  * ElevatedButton.icon(凸起图标按钮))
  * OutlinedButton.icon(轮廓图标按钮)
  * OutlinedButtonTheme(按钮主题设置，这个只是示例)
* 为啥有就按钮还推出新按钮呢？
  * 因为就按钮调整样式麻烦，使用新按钮只需要使用ButtonStyle组件就可以统一控制样式

```dart
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
```

## SingleChildScrollView

* 类似于android中的ScrollView
  * padding:内边距
  * child:子组件
  * scrollDirection:滚动方向,例如Axis.vertical垂直方向滚动
  * reverse：初始滚动位置，false头部、true尾部
  * physics：设置滚动特征
    * ClampingScrollPhysics()：安卓下微光效果
    * BouncingScrollPhysics()：iOS下弹效果

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        padding: EdgeInsets.all(10.0), //内边距
        child: Row(
          children: List.generate(
              50,
              (index) => OutlinedButton(
                    onPressed: () {},
                    child: Text('按钮$index'),
                  )),
        ), //子组件
        scrollDirection: Axis.horizontal, //滚动方向
        reverse: true, //初始滚动位置，false头部、true尾部
        //设置滚动特征
        physics: ClampingScrollPhysics(), //安卓下微光效果
        //   physics:BouncingScrollPhysics()//iOS下弹效果
      ),
      SingleChildScrollView(
          padding: EdgeInsets.all(60.0), //内边距
          child: Column(
              children: List.generate(
                  50,
                  (index) => OutlinedButton(
                        onPressed: () {},
                        child: Text('按钮$index'),
                      ))), //子组件
          scrollDirection: Axis.vertical, //动方向
          reverse: false, //初始滚动位置，false头部、true尾部
          //设置滚动特征
          // physics: ClampingScrollPhysics(),//安卓下微光效果
          physics: BouncingScrollPhysics() //iOS下弹效果
          ),
    ]);
  }
}

```

## ListView

* 加载列表的组件（加载所有widgets,使用widgets较少的场景）

### ListTile

* 声明列表中一个元素布局的组件
* leading：头部组件（一般用于设置图标或者图片）
* title:标题
* subtitle子标题
* trailing:声明尾部的图标
* selected:标记当前选项是否被选中

### ListView.builder

* 按需加载widget,性能比默认构造函数高，适用widget较多的场景

### ListView.separated

* 按需加载widget,性能比默认构造函数高，适用widget较多的场景
* 有分隔器

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ListViewVertical(),
        ListViewHorizontal(),
        ListViewBuilderDemo(),
        ListViewSeparatedDemo()
      ]),
    );
  }
}

class ListViewVertical extends StatelessWidget {
  const ListViewVertical({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: Icon(
              Icons.add,
              color: Colors.lightBlue,
              size: 50,
            ),
            title: Text('标题'),
            subtitle: Text('子标题'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(
              Icons.eighteen_mp,
              color: Colors.lightBlue,
              size: 50,
            ),
            title: Text('标题'),
            subtitle: Text('子标题'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(
              Icons.eighteen_mp_sharp,
              color: Colors.lightBlue,
              size: 50,
            ),
            title: Text('标题'),
            subtitle: Text('子标题'),
            trailing: Icon(Icons.keyboard_arrow_right),
            selected: true,
            selectedTileColor: Colors.red[100],
          )
        ],
      ),
    );
  }
}

class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(20.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 260,
            color: Colors.purple,
          ),
          Container(
            width: 260,
            color: Colors.red,
          ),
          Container(
            width: 260,
            color: Colors.yellow,
          ),
          Container(
            width: 260,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class ListViewBuilderDemo extends StatelessWidget {
  // const ListViewBuilderDemo({Key? key}) : super(key: key);
  final List<Widget> lists = new List.generate(20,
      (index) => OutlinedButton(onPressed: () {}, child: Text('List$index')));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: lists.length, //列表的数量
        itemExtent: 30, //指定当前元素的高度
        itemBuilder: (context, index) {
          return lists[index];
        },
      ),
    );
  }
}

class ListViewSeparatedDemo extends StatelessWidget {
  // const ListViewSeparatedDemo({Key? key}) : super(key: key);
  // Image.asset('/***'
  final List<Widget> products = new List.generate(
      20,
      (index) => ListTile(
            leading: Icon(Icons.add),
            title: Text('标题$index'),
            subtitle: Text('二级标题$index'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ));

  @override
  Widget build(BuildContext context) {
    //奇数分割线样式
    Widget dividerOdd = Divider(
      color: Colors.red,
      thickness: 2,
    );
    Widget dividerEven = Divider(
      color: Colors.blue,
      thickness: 2,
    );
    return Column(
      children: [
        ListTile(
          title: Text('商品列表'),
        ),
        Container(
          height: 200,
          padding: EdgeInsets.all(10.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return products[index];
              },
              separatorBuilder: (context, index) {
                return index % 2 == 0 ? dividerEven : dividerOdd;
              }, //分割器的构造器
              itemCount: products.length),
        )
      ],
    );
  }
}
```

## GridView

* 网格布局
  * children(子组件)
  * scrollDirection(滚动方向)
  * gridDelegate(指定网格的显示方式)
    * SliverGridDelegateWithFixedCrossAxisCount(指定网格布局列数，子组件宽度自适应)
    * SliverGridDelegateWithMaxCrossAxisExtent（指定子组件宽度，列数自适应）

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView(
        // gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount:3,//指定列数
        //   mainAxisSpacing: 20,//主轴方向的间距
        //   crossAxisSpacing: 20,//交叉轴方向上的间距
        //   childAspectRatio: 1.0,//子组件的宽高比例
        // ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0, //每列的宽度
          mainAxisSpacing: 20, //主轴方向的间距
          crossAxisSpacing: 20, //交叉轴方向上的间距
          childAspectRatio: 1.0, //子组件的宽高比例
        ),
        children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.blueGrey,
          ),
          Container(
            color: Colors.brown,
          ),
          Container(
            color: Colors.amberAccent,
          ),
          Container(
            color: Colors.deepPurpleAccent,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
```

### GridView.count

* 指定网格布局列数，宽度自适应

### GridView.extend

* 指定子组件宽度固定，列数自适应

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child:
      // GridView.extent(maxCrossAxisExtent:200,//固定每列宽200
      GridView.count(crossAxisCount: 3,//固定3列
        mainAxisSpacing: 20, //主轴方向的间距
        crossAxisSpacing: 20, //交叉轴方向上的间距
        childAspectRatio: 1.0, //子组件的宽高比例
        children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.blueGrey,
          ),
          Container(
            color: Colors.brown,
          ),
          Container(
            color: Colors.amberAccent,
          ),
          Container(
            color: Colors.deepPurpleAccent,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.blueGrey,
          ),
        ],
      )
    );
  }
}
```

### GridView.builder

* 动态网络布局，只显示可视区域的子组件，与ListView类似，适用于子组件比较多的场景

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<dynamic> _list = [
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.blueGrey,
    ),
    Container(
      color: Colors.brown,
    ),
    Container(
      color: Colors.amberAccent,
    ),
    Container(
      color: Colors.deepPurpleAccent,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.blueGrey,
    ),
  ];
  // const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //指定列数
          mainAxisSpacing: 20, //主轴方向的间距
          crossAxisSpacing: 20, //交叉轴方向上的间距
          childAspectRatio: 1.0, //子组件的宽高比例
        ),
        itemBuilder: (context, index) {
          return _list[index];
        },
        itemCount: _list.length,
        physics:BouncingScrollPhysics(),//允许超出边界——反弹效果
        // physics:ClampingScrollPhysics(),//防止超出边界——夹住效果
        // physics: AlwaysScrollableScrollPhysics(),//始终响应滚动，默认滚动效果就是这个
        // physics:NeverScrollableScrollPhysics(),//不响应滚动
      ),
    );
  }
}

```

## Cupertino与Material



### Cupertino

* ios风格的组件

  ```dart
  import 'package:flutter/cupertino.dart';//ios风格的组件
  ```

### Material

* 安卓风格的组件

  ```dart
  import 'package:flutter/material.dart';//安卓风格的组件
  ```

  ```dart
  import 'package:flutter/material.dart';
  import 'package:flutter/cupertino.dart';
  import 'dart:io'; //判断是在安卓平台还是Ios平台的核心库
  
  class Home extends StatelessWidget {
    const Home({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      Widget _dialogBox = IosDemo();
      //判断当前的平台信息
      if (Platform.isIOS) {
        //  ios风格
        _dialogBox = IosDemo();
      } else if (Platform.isAndroid) {
        //  安卓风格
        _dialogBox = AndroidDemo();
      }
      return Container(
        child: Column(
          children: [_dialogBox],
        ),
      );
    }
  }
  
  class AndroidDemo extends StatelessWidget {
    const AndroidDemo({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Container(
        child: AlertDialog(
          title: Text('AlertDialog安卓风格'),
          content: Text('确认删除吗'),
          actions: [
            TextButton(onPressed: () {}, child: Text('取消')),
            TextButton(onPressed: () {}, child: Text('确认'))
          ],
        ),
      );
    }
  }
  
  class IosDemo extends StatelessWidget {
    const IosDemo({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Container(
        child: CupertinoAlertDialog(
          title: Text('CupertinoAlertDialog Ios风格'),
          content: Text('确认删除吗'),
          actions: [
            CupertinoDialogAction(onPressed: () {}, child: Text('取消')),
            CupertinoDialogAction(onPressed: () {}, child: Text('确认'))
          ],
        ),
      );
    }
  }
  ```

## SafeArea

* 有效解决异形屏的问题（刘海屏）
* child:子组件

# 第三方组件

## dio

* 相当于axios,可以发送网络请求

* 是一个强大的Dart http请求库

* https://pub.dev/packages/dio

  在`pubspec.yaml`文件中dependencies字段下引入

  ```yaml
  dio: ^4.0.3
  ```

* 下载dio

  * 在flutter根目录下终端输入`pub get`或`flutter packages get`或`vscode自动保存`

* 引包

  ```dart
  import 'package:dio/dio.dart';
  ```

```dart
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

```

## flutter_swiper

* flutter当中的轮播组件，可以写轮播图

* https://pub.dev/packages/flutter_swiper

* 在`pubspec.yaml`文件中dependencies字段下引入

  ```yaml
   flutter_swiper: ^1.1.6
  ```

* 下载

  * 在flutter根目录下终端输入`pub get`或`flutter packages get`或`vscode自动保存`

* 引包

  ```dart
  import 'package:flutter_swiper/flutter_swiper.dart';
  ```

引入图片错误解决

> 错误提示：
>
> Error detected in pubspec.yaml:
> Error on line 63, column 5: Expected a key while parsing a block mapping.
>    ╷
> 63 │     assets:
>    │     ^
>    ╵
> Exception: Please correct the pubspec.yaml file at .\pubspec.yaml
>
> 解决办法：在`pubspec.yaml`uses-material-design与assets对齐
>
> ```yaml
> uses-material-design: true
> 
> assets:
>   - images/1.jpeg
>   - images/2.jpeg
> ```

引用错误解决

> 错误提示：
>
> Error: Cannot run with sound null safety, because the following dependencies
>
> 解决办法：
>
> 解决办法1.在项目根目录下打开终端，运行
>
> ```dart
>   flutter run --no-sound-null-safety
>   flutter build apk --no-sound-null-safety
> ```
>
> 解决办法2：在android运行的模拟器旁边`点击main.dart`选择`Edit Configrations `,在属性名为`addtional run args`输入值`--no-sound-null-safety`,点击`Apply`

显示图片没有被找到的解决错误：

> 重启模拟器，因为新加入的图片不能立马被使用，必须重启模拟器才能被使用

```dart
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  final List<String> _imageList = [
    'images/1.jpeg',
    'images/2.jpeg',
    'images/3.jpeg',
    'images/4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          height: 200,
          width: double.infinity,
          child: Swiper(
            itemCount: _imageList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _imageList[index],
                fit: BoxFit.cover, //填充方式
              );
            },
            pagination: SwiperPagination(), //添加小圆点（分页）
            control: SwiperControl(), //添加左右箭头导航
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          height: 200,
          width: double.infinity,
          child: Swiper(
            itemCount: _imageList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _imageList[index],
                fit: BoxFit.cover, //填充方式
              );
            },
            viewportFraction: 0.7, //主图的比例，1表示2占满整个屏幕
            scale: 0.7, //其他图片的比例
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          height: 200,
          width: double.infinity,
          child: Swiper(
            itemCount: _imageList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _imageList[index],
                fit: BoxFit.cover, //填充方式
              );
            },
            itemWidth: 300,
            layout: SwiperLayout.STACK, //指定一些具体的布局
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          height: 200,
          width: double.infinity,
          child: Swiper(
            itemCount: _imageList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _imageList[index],
                fit: BoxFit.cover, //填充方式
              );
            },
            itemWidth: 300,
            itemHeight: 200,
            layout: SwiperLayout.TINDER, //指定一些具体的布局
          ),
        ),
      ],
    );
  }
}

```

## shared_preferences

* 本地数据缓存库

* 相当于web端的localStorage,reactNative中的AsyncStorage

* https://pub.dev/packages/shared_preferences

* 在`pubspec.yaml`文件中dependencies字段下引入

  ```yaml
  shared_preferences: ^2.0.11
  ```

* 下载

  * 在flutter根目录下终端输入`pub get`或`flutter packages get`或`vscode自动保存`

* 引包

  ```dart
  import 'package:shared_preferences/shared_preferences.dart';
  ```

### 增

* set+`合法数据类型`(属性名，属性值)
* setString(k,v)、setBool(k,v)....

### 删

* remove(k)
* clear()

### 改

* set+`合法数据类型`(属性名，属性值)
* setString(k,v)、setBool(k,v)....

### 查

* get+`合法数据类型`(属性名)
* getString(k)...

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  _incrementCounter() async {
    //获取保存实例
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('点击了 $counter 次.');
    //将数据保存到本地缓存
    await prefs.setInt('counter', counter);
  }

  _decrementCounter() async {
    //获取保存实例
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int counter = prefs.getInt('counter') ?? 0;
    if (counter > 0) {
      counter--;
    }
    print('点击了 $counter 次.');
    //将数据保存到本地缓存
    await prefs.setInt('counter', counter);
  }

  _removeCounter() async {
    //获取保存实例
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //将数据移除
    // await prefs.remove('counter');
    //将数据移除
    await prefs.clear();
    int counter = prefs.getInt('counter') ?? 0;
    print('点击了 $counter 次.');
  }

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        ElevatedButton(
          child: Text('递增'),
          onPressed: () {
            _incrementCounter();
          },
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          child: Text('递减'),
          onPressed: () {
            _decrementCounter();
          },
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          child: Text('删除'),
          onPressed: () {
            _removeCounter();
          },
        ),
      ]),
    );
  }
}
```

#  状态管理

* flutter中的组件

  * 按状态划分：
    * StatelessWidget:无状态组件
    * StatefulWidget:有状态组件

  * 按状态作用域分：
    * 组件内私有状态（StatelessWidget）
    * 跨组件状态共享（InheritedWidget、provider）
    * 全局状态（Redux|fish-redux、Mobx...）
  * 状态组件的组成：
    * StatefulWidget：组件本身不可变-@immutable
    * State：将变化的状态放到State中维护

## StatefulWidget

```dart
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
```

## DataTable

* flutter中的表格
* columns:声明表头列表
  * DataColumn:表头单元格
* rows:声明数据列表
  * DataRow:一行数据
    * DataCell:数据单元格

```dart
// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: UserList(),
    );
  }
}

class User {
  String name;
  int age;
  String sex;
  String jianjie;
  bool selected;
  User(this.name, this.age, this.sex, this.jianjie, {this.selected = false});
}

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List data = [
    User('张三', 18, '男', '学生1', selected: true),
    User('李四', 23, '男', '学生2'),
    User('王五', 12, '男', '学生3'),
    User('赵六', 18, '男', '学生4'),
    User('麻八', 13, '男', '学生5'),
  ];
  @override
  Widget build(BuildContext context) {
    var _sortAscending = true;
    List<DataRow> DataRowList = List.generate(
      data.length,
      (index) => DataRow(
          cells: [
            DataCell(Text(data[index].name)),
            DataCell(Text(data[index].age.toString())),
            DataCell(Text(data[index].sex)),
            DataCell(Text(data[index].jianjie)),
          ],
          selected: data[index].selected,
          onSelectChanged: (selected) {
            setState(() {
              data[index].selected = selected;
            });
          }),
    );

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, //设置滚动方向
        child: DataTable(
          sortColumnIndex: 1, //对某一列进行排序，列数由0开始数
          sortAscending: _sortAscending, //指定排序的风格
          dataRowHeight: 50, //指定高度
          checkboxHorizontalMargin: 20, //水平方向外边距
          columnSpacing: 100, //列之间的间距
          columns: [
            DataColumn(label: Text('姓名')),
            DataColumn(
              label: Text('年龄'),
              numeric: true, //可排序
              onSort: (int columnIndex, bool asscending) {
                setState(() {
                  _sortAscending = asscending;
                  if (asscending) {
                    data.sort((a, b) => a.age.compareTo(b.age));//升序
                  } else {
                    data.sort((a, b) => b.age.compareTo(a.age));//降序
                  }
                });
              },
            ),
            DataColumn(label: Text('性别')),
            DataColumn(label: Text('简介')),
          ],
          rows: DataRowList,
        ),
      ),
    );
  }
}
```

## InheritedWidget

提供了**沿树向下，共享数据**的功能（即子组件可以获取父组件的数据）

为什么或出现？

依赖构造函数传递数据的方式不能满足业务需求（所以需要一个新的、更好的跨组件数据传输方案）

通过`context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();`获取具体的数据

```dart
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
    return ShareDataWidget(
      num: _num,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              //  跨组件访问
              child: MyCounter(),
            ),
            ElevatedButton(
                onPressed: () {
                  // 视图随数据变化需要调用setState
                  setState(() {
                    _num++;
                  });
                },
                child: Icon(Icons.add)),
            ElevatedButton(
              onPressed: () {
                // 视图随数据变化需要调用setState
                setState(() {
                  _num--;
                });
              },
              child: Text('-'),
            )
          ],
        ),
      ),
    );
  }
}

//状态组件
class MyCounter extends StatefulWidget {
  const MyCounter({Key? key}) : super(key: key);

  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).num.toString());
  }
}

//数据共享的组件
class ShareDataWidget extends InheritedWidget {
  final int num;
  const ShareDataWidget({Key? key, required Widget child, required this.num})
      : super(key: key, child: child);

  static ShareDataWidget of(BuildContext context) {
    final ShareDataWidget? result =
        context.dependOnInheritedWidgetOfExactType<ShareDataWidget>(); //获取具体的数据
    assert(result != null, 'No ShareDataWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //通知组件去更新
    return true;
  }
}
```

## Provider:第三方组件

是对**InheritedWidget**组件的封装

* 优点：简化资源的分配与处置

* 懒加载

* https://pub.dev/packages/provider

* 在`pubspec.yaml`文件中dependencies字段下引入

  ```yaml
  provider: ^6.0.2
  ```

* 下载

  * 在flutter根目录下终端输入`pub get`或`flutter packages get`或`vscode自动保存`

* 引包

  ```dart
  import 'package:provider/provider.dart';
  ```

* 创建数据模型（T extends ChangeNotifier）

* 创建Provider  (注册数据模型)
  * Provider()：不会被被要求随着数据变动而变动
  * ChangeNotifierProvider()随着某些数据改变而被通知更新
  
* 获取数据模型并更新UI
  * 通过上下文：BuildContext
  * 通过静态方法Provider.of<T>(context)
  
  ```dart
  // ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
  import 'package:flutter/foundation.dart';
  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  
  class Home extends StatelessWidget {
    const Home({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      //2.创建provider(注册数据模型)
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Counter()),
        ],
        child: const MyApp(),
      );
    }
  }
  
  /// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
  // ignore: prefer_mixin
  //1.创建数据模型
  class Counter with ChangeNotifier, DiagnosticableTreeMixin {
    int _count = 0;
    //返回私有内容，外部访问_count的时候只需要.count就可以了
    int get count => _count;
  
    void increment() {
      _count++;
      //  通知ui更新
      notifyListeners();
    }
  
    /// Makes `Counter` readable inside the devtools by listing all of its properties
    @override
    void debugFillProperties(DiagnosticPropertiesBuilder properties) {
      super.debugFillProperties(properties);
      properties.add(IntProperty('count', count));
    }
  }
  
  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MyHomePage();
    }
  }
  
  class MyHomePage extends StatelessWidget {
    const MyHomePage({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('点击次数:'),
            //count组件将从MyHomePage中重建
            Count(),
          ],
        ),
      );
    }
  }
  
  class Count extends StatelessWidget {
    const Count({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      //3.在子组件中使用数据模型
      return Column(children: [
        Text(
          //监控Counter数据模型中的_count
          '${context.watch<Counter>().count}',
        ),
        ElevatedButton(
          //通过静态方法获取Counter数据模型的方法（必须确保MyApp被MultiProvider包裹并指定数据模型才能点出来）
          onPressed: () => context.read<Counter>().increment(),
          child: const Icon(Icons.add),
        )
      ]);
    }
  }
  
  ```
  
  

## 生命周期

* 无状态组件的生命周期只有一个build,构建完毕以后就没有操作了

* 一般说生命周期指有状态组件的生命周期

  * initState()组件对象插入到元素树中时调用，在整个状态的生命周期过程中只会被调用一次

  * didChangeDependencies()当前对象的依赖改变时被调用

  * build()组件渲染时被调用

  * setState()组件对象的内部状态变更时被调用

  * didUpdateWidget()组件配置更新时被调用

  * deactivate()组件对象在元素树中**暂时移除**时被调用

  * dispose()组件对象在元素树中**永远移除**时被调用

    ```dart
    import 'package:flutter/material.dart';
    
    class Home extends StatefulWidget {
      const Home({Key? key}) : super(key: key);
    
      @override
      _HomeState createState() => _HomeState();
    }
    
    class _HomeState extends State<Home> {
      int _num = 0;
      @override
      void initState() {
        //初始化状态,通常根据后台接口的返回数据对状态进行初始化
        // TODO: implement initState
        super.initState();
        print('initState()');
      }
    
      @override
      void didChangeDependencies() {
        // TODO: implement didChangeDependencies
        super.didChangeDependencies();
        print('组件依赖改变：didChangeDependencies()');
      }
    
      @override
      void setState(VoidCallback fn) {
        // TODO: implement setState
        super.setState(fn);
        print('数据状态变化：setState()');
      }
    
      @override
      void didUpdateWidget(covariant Home oldWidget) {
        // TODO: implement didUpdateWidget
        super.didUpdateWidget(oldWidget);
        print('组件配置更新：didUpdateWidget()');
      }
    
      @override
      void deactivate() {
        // TODO: implement deactivate
        super.deactivate();
        print('暂时移除组件（切换页面等）：deactivate()');
      }
    
      @override
      void dispose() {
        // TODO: implement dispose
        super.dispose();
        print('永久移除组件：dispose()');
      }
    
      @override
      Widget build(BuildContext context) {
        print('渲染组件：build()');
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
                  child: Icon(Icons.add)),
              ElevatedButton(
                  onPressed: () {
                    // 视图随数据变化需要调用setState
                    setState(() {
                      _num--;
                    });
                  },
                  child: Text('-')),
            ],
          ),
        );
      }
    }
    ```

## 路由

* Route
  * 一个路由是一个屏幕或页面得抽象
* Navigator
  * 管理路由得组件。
  * 可以通过路由入栈和出栈实现页面之间的跳转
  * 常用属性：
    * initialRoute:初始路由，即默认页面
    * onGenerateRoute:动态路由，即根据规则，匹配动态路由
    * onUnknownRoute:未知路由，即404
    * route：路由集合，即静态路由提前在这个集合中生成好

## 匿名路由

* Navigator

  * push(跳转到指定组件)

    ```dart
     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Product()),
                );
    ```

    

  * pop(回退)

    ```dart
    Navigator.pop(context);
    ```





```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          child: Text('跳转到商品页面'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Product()),
            );
          },
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('商品页面'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}

```



## 命名路由

* 声明路由

  * routes:路由表，Map类型
  * initialRoute：初始路由
  * onUnknownRoute:未知路由，即404

* 跳转到命名路由

  ```dart
  Navigator.pushNamed(
                  context,
                 '路由名称'
              );
  ```

* 在入口文件main.dart中

  ```dart
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import '01_basic/24_命名路由.dart';
  
  main() {
    runApp(MyApp());
  }
  
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: '任务管理器中的标题',
        //声明路由
        routes: {
          'home': (context) => Home(),
          'product': (context) => Product(),
        },
        initialRoute: 'home', //初始路由
        onUnknownRoute: (RouteSettings setting) =>
            MaterialPageRoute(builder: (context) => UnkownPage()), //未知页面都走这个路由
        theme: ThemeData(fontFamily: 'SourceSansPro'),
        debugShowCheckedModeBanner: false, //是否显示左上角调试标志
      );
    }
  }
  
  ```

* 在24_命名路由.dart文件中

  ```dart
  import 'package:flutter/material.dart';
  
  class Home extends StatelessWidget {
    const Home({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('我是appbar'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
              child: Column(
            children: [
              ElevatedButton(
                child: Text('跳转到商品页面'),
                onPressed: () {
                  Navigator.pushNamed(context, 'product');
                },
              ),
              ElevatedButton(
                child: Text('未知路由'),
                onPressed: () {
                  Navigator.pushNamed(context, 'user');
                },
              ),
            ],
          )),
        ),
      );
    }
  }
  
  class Product extends StatelessWidget {
    const Product({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('商品页面'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      );
    }
  }
  
  class UnkownPage extends StatelessWidget {
    const UnkownPage({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('404，页面未找到都走这里'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      );
    }
  }
  
  ```

  

## 动态路由

* main.dart

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//24之后的走这个main.dart(直接将本文件名改为main.dart,或者直接修改入口文件)
// import '01_basic/24_命名路由.dart';
import '01_basic/25_动态路由.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '任务管理器中的标题',
      //动态路由
      onGenerateRoute: (RouteSettings setting) {
        // print(setting.name);
        //  匹配首页
        if (setting.name == '/') {
          return MaterialPageRoute(builder: (context) => Home());
        }
        if (setting.name == 'product') {
          return MaterialPageRoute(builder: (context) => Product());
        }
        //匹配 product/:id
        //对路径进行解析
        // var uri=Uri.parse(setting.name as String);
        var uri = Uri.parse(setting.name!); //空安全判断
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'product') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => ProductDetail(id: id));
        }
        //返回未知页面
        return MaterialPageRoute(builder: (context) => UnkownPage());
      },
      theme: ThemeData(fontFamily: 'SourceSansPro'),
      debugShowCheckedModeBanner: false, //是否显示左上角调试标志
    );
  }
}

```

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是appbar'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: Column(
          children: [
            ElevatedButton(
              child: Text('跳转到商品页面'),
              onPressed: () {
                Navigator.pushNamed(context, 'product');
              },
            ),
            ElevatedButton(
              child: Text('跳转到商品列表1'),
              onPressed: () {
                Navigator.pushNamed(context, 'product/1');
              },
            ),
            ElevatedButton(
              child: Text('跳转到商品列表2'),
              onPressed: () {
                Navigator.pushNamed(context, 'product/2');
              },
            ),
            ElevatedButton(
              child: Text('未知路由'),
              onPressed: () {
                Navigator.pushNamed(context, 'user');
              },
            ),
          ],
        )),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品页面'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('返回'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

class UnkownPage extends StatelessWidget {
  const UnkownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404，页面未找到都走这里'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('返回'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final String? id;
  const ProductDetail({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情页面'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('当前的id是${id}'),
              ElevatedButton(
                child: Text('返回'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```



## 路由传参

###  路由传参-匿名路由

* 路由中声明参数
* 组件中接收参数

* main.dart

  ```dart
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import '01_basic/26_路由传参_匿名路由传参.dart';
  main() {
    runApp(MyApp());
  }
  
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: '任务管理器中的标题',
        home: Home(),
        theme: ThemeData(fontFamily: 'SourceSansPro'),
        debugShowCheckedModeBanner: false, //是否显示左上角调试标志
      );
    }
  }
  ```

  

* 26_路由传参_匿名路由传参.dart

```dart
import 'dart:collection';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是appbar'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: Column(
          children: [
            ElevatedButton(
                child: Text('跳转到商品页面'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Product();
                  }));
                }),
            ElevatedButton(
              child: Text('跳转到商品列表1'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //声明参数
                  return ProductDetail(id: 1);
                }));
              },
            ),
            ElevatedButton(
              child: Text('跳转到商品列表2'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //声明参数
                  return ProductDetail(id: 2);
                }));
              },
            ),
            ElevatedButton(
              child: Text('未知路由'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UnkownPage();
                }));
              },
            ),
          ],
        )),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品页面'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: Column(
          children: [
            Text('接收的参数是:'),
            ElevatedButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        )),
      ),
    );
  }
}

class UnkownPage extends StatelessWidget {
  const UnkownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404，页面未找到都走这里'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('返回'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  //接收参数
  final int? id;
  const ProductDetail({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //接收Home页面传递过来的参数
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情页面${id}'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('当前的id是${id}'),
              ElevatedButton(
                child: Text('返回'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

###  路由传参-命名路由

* 路由中声明参数

  ```dart
  Navigator.pushNamed(
                  context,
                 '路由名称',
                 可选变量
              );
  ```

  

* 组件中接收参数

  ```dart
  ModalRoute.of(context)!.settings.arguments
  ```

* main.dart

  ```dart
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import '01_basic/26_路由传参_命名传参.dart';
  main() {
    runApp(MyApp());
  }
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: '任务管理器中的标题',
        routes: {
          'home': (context) => Home(),
          'product': (context) => Product(),
          'productDetail':(context) => ProductDetail(),
        },
        initialRoute: 'home', //初始路由
  
        onUnknownRoute: (RouteSettings setting) =>
            MaterialPageRoute(builder: (context) => UnkownPage()), //未知页面都走这个路由
        theme: ThemeData(fontFamily: 'SourceSansPro'),
        debugShowCheckedModeBanner: false, //是否显示左上角调试标志
      );
    }
  }
  ```

* 01_basic/26_路由传参_命名传参.dart

  ```dart
  import 'dart:collection';
  import 'package:flutter/material.dart';
  class Home extends StatelessWidget {
    const Home({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('我是appbar'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
              child: Column(
            children: [
              ElevatedButton(
                child: Text('跳转到商品页面'),
                onPressed: () {
                  Navigator.pushNamed(context, 'product',
                      arguments: {'title': '我是Home页面传递过来的参数'});
                },
              ),
              ElevatedButton(
                child: Text('跳转到商品列表1'),
                onPressed: () {
                  Navigator.pushNamed(context, 'productDetail', arguments: {
                    'id': 1,
                  });
                },
              ),
              ElevatedButton(
                child: Text('跳转到商品列表2'),
                onPressed: () {
                  Navigator.pushNamed(context, 'productDetail', arguments: {
                    'id': 2,
                  });
                },
              ),
              ElevatedButton(
                child: Text('未知路由'),
                onPressed: () {
                  Navigator.pushNamed(context, 'user');
                },
              ),
            ],
          )),
        ),
      );
    }
  }
  
  class Product extends StatelessWidget {
    const Product({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      //接收Home页面传递过来的参数
      final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
      return Scaffold(
        appBar: AppBar(
          title: Text('商品页面'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
              child: Column(
            children: [
              Text('接收的参数是:${arguments['title']}'),
              ElevatedButton(
                child: Text('返回'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
        ),
      );
    }
  }
  
  class UnkownPage extends StatelessWidget {
    const UnkownPage({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('404，页面未找到都走这里'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      );
    }
  }
  
  class ProductDetail extends StatelessWidget {
    const ProductDetail({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      //接收Home页面传递过来的参数
      final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
      return Scaffold(
        appBar: AppBar(
          title: Text('商品详情页面${arguments['id']}'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Text('当前的id是${arguments['id']}'),
                ElevatedButton(
                  child: Text('返回'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
  
  ```

  

## Drawer导航

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu), //左侧显示出的菜单
        title: Text("首页"), //应用头部名称
        actions: [Icon(Icons.settings)], //右侧菜单
        elevation: 0.0, //去掉头部阴影
        centerTitle: true, //将title居中
      ),
      body: HomePage(),
      drawer: DrawerList(), //左侧抽屉菜单
      endDrawer: DrawerList(), //右侧抽屉菜单
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Home'),
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0), //将边距设为0就能将图片覆盖状态栏
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('陈毅'),
            accountEmail: Text('chenyi@126.com'),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/1.jpeg"),
                fit: BoxFit.cover, //整个图片填充
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/3.jpeg"),
            ), //当前账号的图片
          ), //抽屉菜单的头部
          ListTile(
            leading: Icon(Icons.settings), //左边的图标
            title: Text('设置'),
            trailing: Icon(Icons.arrow_forward_ios), //右侧图标
          ),
          Divider(
            thickness: 2,
          ), //分割线
          ListTile(
            leading: Icon(Icons.settings), //左边的图标
            title: Text('说明'),
            trailing: Icon(Icons.arrow_forward_ios), //右侧图标
          ),
          Divider(
            thickness: 2,
          ), //分割线
          ListTile(
            leading: Icon(Icons.settings), //左边的图标
            title: Text('回退'),
            onTap: () => Navigator.pop(context), //单击执行的逻辑
            trailing: Icon(Icons.arrow_forward_ios), //右侧图标
          ),
          Divider(
            thickness: 2,
          ), //分割线
          //弹出层
          AboutListTile(
            child: Text('关于'), //关于软件的说明
            applicationName: 'flutter应用', //应用名称
            applicationVersion: ' 1.0.0', //版本号
            icon: CircleAvatar(
              //图标
              child: Text('flutter'),
            ),
            applicationLegalese: "应用法律条例",
            aboutBoxChildren: [
              Text("条例1:xxxxx"),
              Text("条例2"),
              Text("条例3"),
              Text("条例4"),
              Text("条例5"),
            ],
            applicationIcon: Image.asset(
              "images/3.jpeg",
              //  设置尺寸
              width: 50,
              height: 50,
            ), //当前应用图标
          )
        ],
      ),
    );
  }
}
```

## BottomNavigationBar导航

* items:包含导航（BottomNavigationBarItems）的列表

* currentIndex:当前导航索引

* type:导航类型（声明底部导航样式）

* onTap:导航的点击事件，一般会更新导航索引

  ```dart
  import 'package:flutter/material.dart';
  
  class Home extends StatefulWidget {
    const Home({Key? key}) : super(key: key);
  
    @override
    _HomeState createState() => _HomeState();
  }
  
  class _HomeState extends State<Home> {
    //定义导航菜单列表
    final List<BottomNavigationBarItem> bottomNavItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        backgroundColor: Colors.blue,
        label: "首页",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        backgroundColor: Colors.green,
        label: "消息",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        backgroundColor: Colors.amber,
        label: "购物车",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        backgroundColor: Colors.red,
        label: "个人中心",
      ),
    ];
    //定义页面列表
    final List<Widget> pages = [
      Center(
        child: Text(
          "Home",
          style: TextStyle(fontSize: 50),
        ),
      ),
      Center(
        child: Text(
          "Message",
          style: TextStyle(fontSize: 50),
        ),
      ),
      Center(
        child: Text(
          "Cart",
          style: TextStyle(fontSize: 50),
        ),
      ),
      Center(
        child: Text(
          "Person",
          style: TextStyle(fontSize: 50),
        ),
      ),
    ];
    //当前导航索引
    late int currentIndex;
    @override
    void initState() {
      //设置默认状态的
      // TODO: implement initState
      super.initState();
      currentIndex = 0;
    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu), //左侧显示出的菜单
          title: Text("首页"), //应用头部名称
          actions: [Icon(Icons.settings)], //右侧菜单
          elevation: 0.0, //去掉头部阴影
          centerTitle: true, //将title居中
        ),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavItems, //包含导航（BottomNavigationBarItems）的列表
          currentIndex: currentIndex, //当前导航索引
          type: BottomNavigationBarType.fixed, //导航类型（声明底部导航样式），
          // type: BottomNavigationBarType.shifting,
          onTap: (index) {
            _changePage(index);
          }, //导航的点击事件，一般会更新导航索引
        ),
      );
    }
  
    //改变页面索引从而改变页面
    void _changePage(int index) {
      if (index != currentIndex) {
        setState(() {
          currentIndex = index;
        });
      }
    }
  }
  ```

  



## Tab导航

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  //菜单数组
  final List<Widget> _tabs = [
    Tab(
      text: "首页",
      icon: Icon(Icons.home),
    ),
    Tab(
      text: "添加",
      icon: Icon(Icons.add),
    ),
    Tab(
      text: "搜索",
      icon: Icon(Icons.search),
    ),
    Tab(
      text: "时间",
      icon: Icon(Icons.add_alarm_sharp),
    ),
  ];
  //页面数组
  final List<Widget> _tabViews = [
    Center(
      child: Text(
        "首页",
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        "添加",
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        "搜索",
        style: TextStyle(fontSize: 50),
      ),
    ),
    Center(
      child: Text(
        "时间",
        style: TextStyle(fontSize: 50),
      ),
    ),
  ];
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //DefaultTabController：整个Tab导航的容器
    return DefaultTabController(
      length: _tabs.length, //导航数量
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu), //左侧显示出的菜单
          title: Text("首页"), //应用头部名称
          actions: [Icon(Icons.settings)], //右侧菜单
          elevation: 0.0, //去掉头部阴影
          centerTitle: true, //将title居中
          // TabBar：导航菜单
          bottom: TabBar(
            tabs: _tabs, //导航菜单数组
            labelColor: Colors.yellow, //设置菜单颜色
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab, //设置导航横线的大小
            indicatorColor: Colors.yellow,
            indicatorWeight: 5,
          ),
        ),
        //TabBarView：导航页面
        body: TabBarView(
          children: _tabViews, //多个导航页面内容
        ),

        bottomNavigationBar: TabBar(
          tabs: _tabs,
          labelColor: Colors.blue, //设置菜单颜色
          unselectedLabelColor: Colors.black, //未选中菜单的颜色
        ),
      ),
    );
  }
}
```

## Switch

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CupertinoSwitch（ios风格的switch开关） Switch（安卓风格的switch开关）
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: SwitcchDemo(),
    );
  }
}

class SwitcchDemo extends StatefulWidget {
  const SwitcchDemo({Key? key}) : super(key: key);

  @override
  _SwitcchDemoState createState() => _SwitcchDemoState();
}

class _SwitcchDemoState extends State<SwitcchDemo> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            title: Text("当前的状态时${_switchValue == true ? "选中" : "未选中"}"),
            leading: Switch(
              value: _switchValue, //开关的值，一般与状态字段绑定
              onChanged: (bool val) {
                //开关状态发生变更的时候调用
                setState(() {
                  _switchValue = val;
                });
              },
              activeColor: Colors.orange, //开关开启时的圆圈颜色
              activeTrackColor: Colors.pink, //开关开启的时候轨道的颜色
              inactiveThumbColor: Colors.grey, //开关关闭时的圆圈颜色
              inactiveTrackColor: Colors.blue[100], //开关关闭的时候轨道的颜色
            ),
          ),
          ListTile(
            title: Text("Ios风格，当前的状态时${_switchValue == true ? "选中" : "未选中"}"),
            leading: CupertinoSwitch(
              value: _switchValue, //开关的值，一般与状态字段绑定
              onChanged: (bool val) {
                //开关状态发生变更的时候调用
                setState(() {
                  _switchValue = val;
                });
              },
              activeColor: Colors.orange[100], //开关开启时的轨道颜色
              trackColor: Colors.blueGrey[100], //开关关闭的时候轨道的颜色
              thumbColor: Colors.red, //圆圈颜色
            ),
          )
        ],
      ),
    );
  }
}
```

## Checkbox



```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: CheckBoxDemo(),
    );
  }
}

class CheckBoxDemo extends StatefulWidget {
  const CheckBoxDemo({Key? key}) : super(key: key);

  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _male = true;
  bool _female = false;
  bool _other = false;
  bool _value1 = true;
  bool _value2 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text("男"),
            leading: Checkbox(
              value: _male, //复选框的值，一般与状态字段绑定
              onChanged: (bool? val) {
                setState(() {
                  _male = val!;
                });
              },
              activeColor: Colors.orange[100], //选中时，复选框的背景颜色
              checkColor: Colors.lightBlue, //选中时，复选框中对号的颜色
            ),
          ),
          ListTile(
            title: Text("女"),
            leading: Checkbox(
              value: _female, //复选框的值，一般与状态字段绑定
              onChanged: (bool? val) {
                setState(() {
                  _female = val!;
                });
              },
              activeColor: Colors.orange[100], //选中时，复选框的背景颜色
              checkColor: Colors.lightBlue, //选中时，复选框中对号的颜色
            ),
          ),
          ListTile(
            title: Text("第三性别"),
            leading: Checkbox(
              value: _other, //复选框的值，一般与状态字段绑定
              onChanged: (bool? val) {
                setState(() {
                  _other = val!;
                });
              },
              activeColor: Colors.orange[100], //选中时，复选框的背景颜色
              checkColor: Colors.lightBlue, //选中时，复选框中对号的颜色
            ),
          ),
          CheckboxListTile(
            //可选中列表
            secondary: Icon(
              Icons.settings,
              size: 30,
            ), //左侧图标
            value: _value2,
            activeColor: Colors.orange[100], //选中时，复选框的背景颜色
            checkColor: Colors.lightBlue, //选中时，复选框中对号的颜色
            selected: _value2, //选中时整个列表添加背景，这个与上面activeColor一起用
            onChanged: (bool? val) {
              setState(() {
                _value2 = val!;
              });
            },
            title: Text("可选中标题列表"),
            subtitle: Text("二级标题"),
          ),
          CheckboxListTile(
            //可选中列表
            secondary: Icon(
              Icons.settings,
              size: 30,
            ), //左侧图标
            value: _value1,
            activeColor: Colors.orange[100], //选中时，复选框的背景颜色

            checkColor: Colors.lightBlue, //选中时，复选框中对号的颜色
            selected: _value1, //选中时整个列表添加背景，这个与上面activeColor一起用
            onChanged: (bool? val) {
              setState(() {
                _value1 = val!;
              });
            },
            title: Text("可选中标题列表"),
            subtitle: Text("二级标题"),
          ),
        ],
      ),
    );
  }
}
```

## Radio

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: RadioDemo(),
    );
  }
}

class RadioDemo extends StatefulWidget {
  const RadioDemo({Key? key}) : super(key: key);

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _gender = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 1, //单选框的值
                onChanged: (int? value) {
                  setState(() {
                    _gender = value!;
                  });
                }, //状态变更时调用
                groupValue: _gender, //选择组的值
                activeColor: Colors.orange[100], //选中时背景颜色
              ),
              Text("男"),
              Radio(
                value: 2, //单选框的值
                onChanged: (int? value) {
                  setState(() {
                    _gender = value!;
                  });
                }, //状态变更时调用
                groupValue: _gender, //选择组的值
                activeColor: Colors.orange[100], //选中时背景颜色
              ),
              Text("女"),
              Radio(
                value: 3, //单选框的值
                onChanged: (int? value) {
                  setState(() {
                    _gender = value!;
                  });
                }, //状态变更时调用
                groupValue: _gender, //选择组的值
                activeColor: Colors.orange[100], //选中时背景颜色
              ),
              Text("变性人"),
            ],
          ),
          //单选列表
          RadioListTile(
            secondary: Icon(
              Icons.person,
              size: 30,
            ), //右侧图标
            title: Text("男，这个value等于1"),
            subtitle: Text("二级标题"),
            value: 1, //单选框的值
            onChanged: (int? value) {
              setState(() {
                _gender = value!;
              });
            }, //状态变更时调用
            groupValue: _gender, //选择组的值
            activeColor: Colors.orange[100], //选中时背景颜色
            selected: _gender == 1 ? true : false,
          ),
          //单选列表
          RadioListTile(
            secondary: Icon(
              Icons.person,
              size: 30,
            ), //左侧图标
            title: Text("女，这个value等于2"),
            subtitle: Text("二级标题"),
            value: 2, //单选框的值
            onChanged: (int? value) {
              setState(() {
                _gender = value!;
              });
            }, //状态变更时调用
            groupValue: _gender, //选择组的值
            activeColor: Colors.orange[100], //选中时背景颜色
            selected: _gender == 2 ? true : false,
          ),
          //单选列表
          RadioListTile(
            secondary: Icon(
              Icons.person,
              size: 30,
            ), //左侧图标
            title: Text("变性人，这个value等于3"),
            subtitle: Text("二级标题"),
            value: 3, //单选框的值
            onChanged: (int? value) {
              setState(() {
                _gender = value!;
              });
            }, //状态变更时调用
            groupValue: _gender, //选择组的值
            activeColor: Colors.orange[100], //选中时背景颜色
            selected: _gender == 3 ? true : false,
          ),
        ],
      ),
    );
  }
}
```

## TextField

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: TextFieldDemo(),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  late String phone;
  late String password;
  late String description;
  _submit() {
    print(phone);
    print(password);
    print(description);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              autofocus: true, //是否获取焦点
              keyboardType: TextInputType.phone, //键盘类型
              obscureText: false, //设置为密码框
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  size: 20,
                ), //设置图标
                labelText: "手机号", //标题
                hintText: "请输入手机号", //提示内容-placeholder
                hintStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                ), //提示时的样式
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ), //聚焦时边框的样式
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.yellow,
                  ),
                ), //默认边框的样式
              ), //样式修饰
              onChanged: (value) {
                setState(() {
                  phone = value;
                });
              }, //内容更改时自动调用-value
              maxLines: 1, //显示行数-文本域
              maxLength: 11, //输入文本的最大长度
            ),
            TextField(
              autofocus: false, //是否获取焦点
              keyboardType: TextInputType.phone, //键盘类型
              obscureText: true, //设置为密码框
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.password,
                  size: 20,
                ), //设置图标
                labelText: "密码", //标题
                hintText: "请输入密码", //提示内容-placeholder
                hintStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                ), //提示时的样式
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ), //聚焦时边框的样式
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.yellow,
                  ),
                ), //默认边框的样式
              ), //样式修饰
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              }, //内容更改时自动调用-value
              maxLines: 1, //显示行数-文本域
              maxLength: 11, //输入文本的最大长度
            ),
            TextField(
              autofocus: false, //是否获取焦点
              keyboardType: TextInputType.phone, //键盘类型
              obscureText: false, //设置为密码框
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.description,
                  size: 20,
                ), //设置图标
                labelText: "描述", //标题
                hintText: "请简单描述用户", //提示内容-placeholder
                hintStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                ), //提示时的样式
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ), //聚焦时边框的样式
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.yellow,
                  ),
                ), //默认边框的样式
              ), //样式修饰
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              }, //内容更改时自动调用-value
              maxLines: 5, //显示行数-文本域
              maxLength: 50, //输入文本的最大长度
            ),
            ElevatedButton(
              onPressed: () {
                _submit();
              },
              child: Text("提交"),
            ),
          ],
        ));
  }
}
```

## Calendar

* CalendarDatePicker:
  * initialCalendarMode：日历默认展示方式
    * DatePickerMode.day：以日期为单位展示
    * DatePickerMode.year：以年为单位展示
  
* showDatePicker：日期选择器（首字母小写）
  * initialCalendarMode：日历默认展示方式
    * DatePickerMode.day：以日期为单位展示
    * DatePickerMode.year：以年为单位展示
  * initialEntryMode:
    * DatePickerEntryMode.calendar ,//点选模式
    * DatePickerEntryMode.input ,//输入模式
  
* showTimePicker时间选择器

  ```dart
  import 'package:flutter/material.dart';
  
  class Home extends StatelessWidget {
    const Home({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("首页"), //应用头部名称
        ),
        body: CalendarDemo(),
      );
    }
  }
  
  class CalendarDemo extends StatefulWidget {
    const CalendarDemo({Key? key}) : super(key: key);
  
    @override
    _CalendarDemoState createState() => _CalendarDemoState();
  }
  
  class _CalendarDemoState extends State<CalendarDemo> {
    @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            _showDatePicker(context),
            _calendarDatePicker(context),
            _showTimePicker(context)
          ],
        ),
      );
    }
  
    ElevatedButton _showDatePicker(context) {
      return ElevatedButton(
        onPressed: () {
          showDatePicker(
              context: context,
              initialDatePickerMode: DatePickerMode.day, //展示默认，默认天数为展示模式
              initialDate: DateTime.now(), //初始化选中日期
              firstDate: DateTime(1997, 4, 15), //开始日期
              lastDate: DateTime(2025, 12, 1), //结束日期
              initialEntryMode: DatePickerEntryMode.calendar, //日历弹框样式
              currentDate: DateTime.now(), //当前日期
              helpText: "日期选择器", //左上方提示
              cancelText: "取消",
              confirmText: "确定",
              errorFormatText: "格式错误",
              errorInvalidText: "输入不在1997,4,15——2022,2,1之间",
              fieldHintText: "输入框上方提示",
              useRootNavigator: true, //是否为根导航器
              //  设置不可选日期
              selectableDayPredicate: (dayTime) {
                if (dayTime == DateTime(2022, 1, 15)) {
                  return false;
                }
                return true;
              });
        },
        child: Text("showDatePicker"),
      );
    }
  
    ElevatedButton _showTimePicker(context) {
      return ElevatedButton(
        onPressed: () {
          showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            initialEntryMode: TimePickerEntryMode.dial, //弹框样式
            helpText: "时间选择器", //左上方提示
            cancelText: "取消",
            confirmText: "确定",
            errorInvalidText: "errorInvalidText",
            useRootNavigator: true, //是否为根导航器
            minuteLabelText: "minuteLabelText",
            hourLabelText: "hourLabelText",
            // routeSettings:RouteSettings(
            // name: "name",
            //   arguments: {
            //   "name":"111111",
            //     "yayya":"222"
            //   },
            // )
          );
        },
        child: Text("showTimePicker"),
      );
    }
  
    ElevatedButton _calendarDatePicker(context) {
      return ElevatedButton(
        onPressed: () {
          CalendarDatePicker(
            initialCalendarMode: DatePickerMode.day, //展示默认，默认天数为展示模式
            initialDate: DateTime.now(), //初始化选中日期
            firstDate: DateTime(1997, 4, 15), //开始日期
            lastDate: DateTime(2025, 2, 1), //结束日期
            currentDate: DateTime.now(), //当前日期
            onDisplayedMonthChanged: (dayTime) {
              print(dayTime);
            },
            //  设置不可选日期
            selectableDayPredicate: (dayTime) {
              if (dayTime == DateTime(2022, 1, 15)) {
                return false;
              }
              return true;
            },
            onDateChanged: (DateTime value) {},
          );
        },
        child: Text("CalendarDatePicker"),
      );
    }
  }
  ```

## Form

* 表单容器
  * 表单唯一的键
    * `final GlobalKey<FormState> _formey=GlobalKey<FormState>();`
  * 验证表单
    * `_formey.currentState!.validate()`
  * 提交表单
    * `_formey.currentState!.save()`
  * 重置表单
    * `_formey.currentState!.reset()`

* 使用步骤

  * 创建表单form并以`GlobalKey`作为唯一标识

  * 添加一些带验证逻辑的TextFormField到Form中

    

## TextFormField:输入框

* 与TextFormField的区别
  * 必须在Form内使用且带有验证器（validator）
* validator:验证器
* obscureText：密码框
* onsaved:
  * 设置表单字段的值
  * 在表单的`save()`方法之后执行
    * 即在`_formey.currentState!.save()`之后执行

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: FormDemo(),
    );
  }
}

class FormDemo extends StatefulWidget {
  const FormDemo({Key? key}) : super(key: key);
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  //创建表单全局唯一的键
  final GlobalKey<FormState> _formey = GlobalKey<FormState>();
  late String _phone;
  late String _password;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "手机号",
                    ),
                    validator: (value) {
                      RegExp reg = new RegExp(r'^\d{11}$');
                      if (!reg.hasMatch(value!)) {
                        return '手机号非法';
                      }
                      return null;
                    },
                    obscureText: false, //为true是密码框
                    onSaved: (value) {
                      // 设置表单字段的值
                      _phone = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "密码",
                    ),
                    validator: (value) {
                      if (value!.length < 8) {
                        return "密码长度不够";
                      }
                    },
                    obscureText: true, //为true是密码框
                    onSaved: (value) {
                      // 设置表单字段的值
                      _password = value!;
                    },
                  ), //输入框
                ],
              ),
              key: _formey,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formey.currentState!.validate()) {
                        print("验证成功，提交表单");
                        //  提交表单
                        _formey.currentState!.save();
                        print(_phone);
                        print(_password);
                      }
                    },
                    child: Text("提交"),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
```

## 动画

* 动画分类：
  * 补间(Tween)动画：在补间动画中，定义了**开始点**和**结束点**、**时间线**以及定义**转换时间**和**速度的曲线**。然后由框架计算如何从开始点过渡到结束点。
* 基于物理的动画：在基于物理的动画中，运动被模拟为与真实世界的行为相似。例如，当你掷球时，它在何处落地，取决于抛球速度有多快、球有多重、距离地面有多远。 类似地，将连接在弹簧上的球落下（并弹起）与连接到绳子上的球放下的方式也是不同。

## Animation

Animation是flutter动画库中的一个核心类，它包含动画的**值**和**状态**两个属性，定义了动画的一系列**监听函数**

* ## 监听值:

  * addListener
  * removeListener

* ## 监听状态：

  * addStatusListener
  * removeStatusListener

* ## 动画状态：

  * AnimationStatus.dismissed
    * 动画初始状态
  * AnimationStatus.completed
    * 动画结束状态
  * AnimationStatus.foeward
    * 动画处在从开始到结束的运行状态
  * AnimationStatus.reverse
    * 动画处在从结束到开始的运行状态

## AnimationController

动画控制器:在指定事件内，将组件属性值由初始值演变到终止值，从而形成动画效果

* AnimationController 参数：
  * duration(动画正方向执行时间)
  * reverseDuration:动画反向执行时间
  * lowerBound=0.0(动画最小值)
  * upperBound=1.0(动画最大值)
  * value(动画初始值，默认是lowerBound)
  * vsync(TickerProvider类型的对象，用来创建Ticker对象)
  * 当创建一个AnimationController时，需要传递一个vsync参数
    * vsync的作用是：防止屏幕外动画（动画页面切换到后台时）消耗不必要的资源
  * 通过SingleTickerProviderStateMixin添加到类定义中，可以将stateful对象作为vsync的值

* AnimationController 具有控制动画的方法:
  * .forward()可以正向执行动画
  * .reverse()可以反向执行动画
  * .dispose()用来释放动画资源的（在不使用时，需要调用该方法，否则会造成资源泄露）
  * .stop()用来停止动画运行

## 动画-Tween

* AnimationController动画生成值的默认区间时0.0到1.0，如果希望使用不同区间或不同的数据类型，需要使用Tween(补间动画)
* Tween的唯一职责就是定义从输入范围到输出范围的映射
* Tween
  * Tween<double>(begin:起始值,end:结束值);
  * ColorTween(begin:Colors.white,end:Colors.block);

##  动画-CurvedAnimation

* 动画曲线：动画的执行速度有多种（匀速、先快后慢，先慢后快）这里的速度称为曲线运动
* CurvedAnimation(parent:controller，curve：Curves.easeIn)
  * parent:动画控制器对象
  * curve:正向执行的动画曲线
  * reverseCurve:反向执行的动画曲线
* Curves:动画曲线类型

## 动画-步骤

* 创建动画控制器
  * `controller=AnimationController(duration,vsync,value)`  //vsync是TickerProvider
  
* 创建动画

  * 指定动画曲线（CurvedAnimation）
  * 指定动画数值的变化区间（Tween）

* 监听动画

  * addListener():监听动画的生成值

  * addStatusListener()：监听动画状态

  * 执行动画

    * controller.forward()//正向执行
* controller.reverse()//反向执行

```dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: AnimationDemo(),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

//with使用混入
class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller; //控制器
  late Animation<double> animation; //具体动画
  @override
  // 初始化动画
  void initState() {
    super.initState();
    //1. 创建AnimationController
    controller = AnimationController(
      duration: Duration(milliseconds: 400), //执行时间
      vsync:
          this, //this是当前的状态组件对象。能直接使用this的原因是后面会使用SingleTickerProviderStateMixin
    );
    // createTicker的作用是通知组件一帧一帧的更新动画
    //  2.1给动画控制器声明动画曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //2.2设置动画值的范围
    animation = Tween(begin: 50.0, end: 400.0).animate(animation);
    //  3.监听动画
    animation.addListener(() {
      print("当前动画的值:${animation.value}");
      setState(() {});
    });
    //  4.执行动画
    // controller.forward();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.forward(); //执行动画
                },
                child: Text("放大"),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.reverse(); //反向执行动画
                },
                child: Text("缩小"),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.stop(); //停止执行动画
                },
                child: Text("停止"),
              ),
              ElevatedButton(
                onPressed: () {
                  animation.addStatusListener((status) {
                    if (status == AnimationStatus.completed) {
                      //   如果动画执行结束，反向执行动画
                      controller.reverse(); //反向执行动画
                    } else if (status == AnimationStatus.dismissed) {
                      //  如果动画处于开始的状态，正向执行动画
                      controller.forward(); //执行动画
                    }
                  });
                  controller.forward(); //执行动画
                },
                child: Text("重复"),
              ),
            ],
          ),
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: animation.value, //将动画效果加到图标上
          ),
          Opacity(
            opacity: controller.value,
            child: Text("controller.value是默认值，范围0-1"),
          ),
        ],
      ),
    );
  }

//  释放动画
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}

```





## 交织动画

由多个单一动画叠加而成的复杂动画

## Transform(对组件进行矩阵变换)

* 平移：Transform.translate()
* 旋转：Transform.rotate()
* 缩放：Transform.scale()

```dart
import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: AnimationDemo(),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

//with使用混入
class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller; //控制器
  late Animation<double> animation; //具体动画
  late Animation sizeAnimation;
  late Animation colorAnimation;
  late Animation rotateAnimation;

  @override
  // 初始化动画
  void initState() {
    super.initState();
    //1. 创建AnimationController
    controller = AnimationController(
      duration: Duration(seconds: 3), //执行时间
      vsync:
          this, //this是当前的状态组件对象。能直接使用this的原因是后面会使用SingleTickerProviderStateMixin
    );
    /*****************************************************************************************

    // createTicker的作用是通知组件一帧一帧的更新动画
    //  2.给动画控制器声明动画曲线
    animation = CurvedAnimation(parent: controller, curve: Interval(0.0, 0.5));
    //  3.监听动画
    animation.addListener(() {
      print("当前动画的值:${animation.value}");
      setState(() {});
    });

    *****************************************************************************************/
    // 以上两步合成一步
    //2.创建动画
    // Interval：每个动画的时间间隔
    animation = CurvedAnimation(parent: controller, curve: Interval(0.0, 0.5))
      ..addListener(() {
        setState(() {});
      });
    //3.让动画反复运行
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //   如果动画执行结束，反向执行动画
        controller.reverse(); //反向执行动画
      } else if (status == AnimationStatus.dismissed) {
        //  如果动画处于开始的状态，正向执行动画
        controller.forward(); //执行动画
      }
    });
    //  4.设置其他动画
    sizeAnimation = Tween(begin: 0.0, end: 200.0).animate(animation);
    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.red).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.8, curve: Curves.bounceIn)))
      ..addListener(() {
        setState(() {});
      });
    rotateAnimation = Tween(begin: 0.0, end: 2 * pi).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.8, 1.0, curve: Curves.easeIn)))
      ..addListener(() {
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.stop(); //停止执行动画
                },
                child: Text("停止"),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.forward(); //执行动画
                },
                child: Text("重复"),
              ),
            ],
          ),
          Opacity(
            opacity: controller.value,
            child: Transform.rotate(
              angle: rotateAnimation.value,
              child: Container(
                width: sizeAnimation.value,
                height: sizeAnimation.value,
                color: colorAnimation.value,
              ),
            ),
          ),
        ],
      ),
    );
  }

//  释放动画
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}

```



## Hero动画

用来实现跨页面的动画效果

* 在不同的页面中声明一个共享组件
* 由于共享组件在不同页面中的位置、外观等不同，路由切换时，形成动画效果



* 实现：
  * 在页面A中定义**起始**hero组件，声明**tag**
  * 在页面B中定义**目标**hero组件，绑定相同的**tag**
    * 如何绑定相同tag:
      * 在页面跳转时，通过Navigator，传递**tag**

```dart
import 'dart:math';

import 'package:flutter/material.dart';
import '36_3_1_ImageDetail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //应用头部名称
      ),
      body: HeroAnimation(),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView.extent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        children: List.generate(20, (index) {
          String imageURL =
              "https://picsum.photos/id/${index}/300/400"; //自动生成图片的网址
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) {
                return ImageDetail(imageURL);
              }));
            },
            child: Hero(
              tag: imageURL,
              child: Image.network(imageURL),
            ),
          ); //手势的识别
        }),
      ),
    );
  }
}

```



* 新建页面   36_3_1_ImageDetail.dart

```dart
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final String imageURL;
  ImageDetail(this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            //  跳回去
            Navigator.pop(context);
          },
          child: Hero(
            tag: imageURL,
            child: Image.network(
              imageURL,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

```

##  GestureDetector()

手势的识别

## 多语言（国际化）



终端系统语言切换时，flutter应用得语言也跟随切换

* 组件国际化

  * 要使用flutter_localizations，请将该包作为依赖项添加到您的`pubspec.yaml`文件中：

    ```
    dependencies:
      flutter:
        sdk: flutter
      flutter_localizations:
        sdk: flutter
    ```

    

  * 安装：flutter pub get 

  * 导入flutter_localizations库，并指定MaterialApp的`localizationsDelegates`和`supportedLocales`

    * localizationsDelegates:指定哪些组件需要国际化，
    * supportedLocales：指定应用要支持哪些语言

    ```dart
    import 'package:flutter_localizations/flutter_localizations.dart';
    
    new MaterialApp(
     localizationsDelegates: [
       // ... app-specific localization delegate[s] here
       GlobalMaterialLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate,
     ],
     supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('he', 'IL'), // Hebrew
        // ... other locales the app supports
      ],
      // ...
    )
    ```

    

  * 查看组件效果

    * 在模拟器将语言设置为中文（需要什么语言，就将什么语言拖到最顶部）

  * 在main.dart文件中

  ```dart
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_localizations/flutter_localizations.dart';
  // import '01_basic/37_多语言.dart';
  import '01_basic/34_Calendar.dart';
  main() {
    runApp(MyApp());
  }
  
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: '任务管理器中的标题',
        home: Scaffold(
          appBar: AppBar(
            title: Text('我是appbar'),
            centerTitle: true,
          ),
          body: Home(),
        ),
        theme: ThemeData(fontFamily: 'SourceSansPro'),
        debugShowCheckedModeBanner: false, //是否显示左上角调试标志
      //  国际化
        localizationsDelegates: [
        //  本地化代理：指定哪些组件需要国际化
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          // 支持得语言
          const Locale('en', 'US'), // English
          const Locale('he', 'IL'), // Hebrew
          const Locale('zh', 'CN'), // China
        ],
      );
    }
  }
  
  ```

  

* 文本国际化

* 多语言-文本-加载语言包

  * 检测当前语言

    

## 多主体

















