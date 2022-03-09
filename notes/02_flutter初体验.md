## Flutter(一)之Flutter开发初体验

原创 coderwhy [coderwhy](javascript:void(0);) *2019-09-19*

重新整理：Leienhui 2021.12.1

## 一. 创建Flutter项目

> 创建Flutter项目有两种方式：`通过命令行创建` 和 `通过开发工具创建`

### 1.1. 通过命令行创建

通过命令行创建非常简单，在终端输入以下命令即可：

- **注意：**Flutter的名称不要包含特殊的字符，另外**不可以使用驼峰标识**
- 创建完之后使用自己喜欢的开发工具打开即可

```
flutter create 项目文件夹的名称
```

切换到创建的文件夹中：`cd  项目文件夹的名称`

运行：`flutter run`

### 1.2. 通过开发工具创建

我这里也可以直接通过**Android Studio**来进行创建：

- 选择`New Flutter Project`，之后填写相关的信息即可

### 1.3. 默认程序分析

创建的应用起来跑在模拟器上，会看到一个**计数器**

**默认项目分析：**

- 在目录下有一个`lib`文件夹，里面会存放我们编写的Flutter代码；
- 打开发现里面有一个`main.dart`，它是我们Flutter启动的`入口文件`，里面有`main函数`；

**默认代码分析：**

- 这是一个计数器的案例程序，点击右下角的 `+` 符号，上面显示的数字会递增；
- 但是我们第一次接触main.dart中的代码，可能会发现很多`不认识`的代码，不知道这个内容是如何编写出来的；

**作为初学者，我的建议是将其中所有的代码全部删除掉，从零去创建里面的代码，这样我们才能对Flutter应用程序的结构非常清晰；**

## 二. 开始Flutter代码

### 2.1. Hello World

#### 2.1.1. Hello World的需求

做任何的开发，我们都是从祖传的`Hello World`开始，那么现在我们的需求来了：

- 在界面中心位置，显示一个Hello World；

#### 2.1.2. Hello World的实现

下面，我们就动手开始编写Hello World：

```c
import 'package:flutter/material.dart';
main(List<String> args) {  runApp(Text("Hello World", textDirection: TextDirection.ltr));}
```

### 2.2. 代码分析

#### 2.2.1. runApp和Widget

**runApp**是Flutter内部提供的一个函数，当我们启动一个Flutter应用程序时就是从调用这个函数开始的

- 我们可以点到runApp的源码，查看到该函数
- 我们暂时不分析具体的源码（因为我发现过多的理论，对于初学者来说并不友好）


```
void runApp(Widget app) {  ...省略代码}
```

该函数让我们传入一个东西：**Widget**？

我们先说**Widget的翻译**：

- Widget在国内有很多的翻译；
- 做过Android、iOS等开发的人群，喜欢将它翻译成**控件**；
- 做过Vue、React等开发的人群，喜欢将它翻译成**组件**；
- 如果我们使用Google，Widget翻译过来应该是**小部件**；
- 没有说哪种翻译一定是对的，或者一定是错的，但是我个人更倾向于**小部件或者组件**；

**Widget**到底什么东西呢？

- 我们学习Flutter，从一开始就可以有一个基本的认识：**Flutter中万物皆Widget（万物皆可盘）**；
- 在我们iOS或者Android开发中，我们的界面有很多种类的划分：应用（Application）、视图控制器（View Controller）、活动（Activity）、View（视图）、Button（按钮）等等；
- 但是在Flutter中，**这些东西都是不同的Widget而已**；
- 也就是我们整个应用程序中`所看到的内容`几乎都是Widget，甚至是`内边距的设置`，我们也需要使用一个叫`Padding的Widget`来做；

runApp函数让我们传入的就是一个Widget：

- 但是我们现在没有Widget，怎么办呢？
- 我们可以导入Flutter默认已经给我们提供的Material库，来使用其中的很多内置Widget,或者用flutter自动匹配的其他库也行；
  * 例如:`import 'package:flutter/cupertino.dart';`

#### 2.2.2. Material设计风格

> 使用Material风格后可以不需要设置排版方向了，因为默认从左往右

**material是什么呢？**

- material是Google公司推行的一套`设计风格`，或者叫`设计语言`、`设计规范`等；
- 里面有非常多的设计规范，比如`颜色`、`文字的排版`、`响应动画与过度`、`填充`等等；
- 在Flutter中高度集成了`Material风格的Widget`；
- 在我们的应用中，我们可以直接使用这些Widget来创建我们的应用（后面会用到很多）；

**Text小部件分析**：

- 我们可以使用Text小部件来完成文字的显示；
- 我们发现Text小部件继承自StatelessWidget，StatelessWidget继承自Widget；
- 所以我们可以将Text小部件传入到runApp函数中
- 属性非常多，但是我们已经学习了Dart语法，所以你会发现只有this.data属性是必须传入的。


**StatelessWidget简单介绍：**

- StatelessWidget继承自Widget；
- 后面我会更加详细的介绍它的用法；


```
abstract class StatelessWidget extends Widget {	// ...省略代码}
```

### 2.3. 代码改进

#### 2.3.1. 改进界面样式

我们发现现在的代码并不是我们想要的最终结果：

- 我们可能希望文字居中显示，并且可以大一些；
- **居中显示：** 需要使用另外一个Widget，`Center`；
- **文字大一些：** 需要给Text文本设置一些样式；

我们修改代码如下：

- 我们在Text小部件外层包装了一个Center部件，让Text作为其child；
- 并且，我们给Text组件设置了一个属性：style，对应的值是TextStyle类型；


```java
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(Center(
    child: Text(
      "hello world",
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 30, color: Colors.orange),
    ),
  ));
}
```

* 使用Material风格`MaterialApp`

  ```java
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  
  main(List<String> args) {
  //  1.调用runApp函数
  //设置Text的排版方向
    runApp(
      MaterialApp(
          home: Center(
        child: Text(
          "hello world",
          style: TextStyle(fontSize: 30, color: Colors.orange),
        ),
      )),
    );
  }
  ```

#### 2.3.2. 改进界面结构

目前我们虽然可以显示HelloWorld，但是我们发现最底部的背景是黑色，并且我们的页面并不够结构化。

- 正常的App页面应该有一定的结构，比如通常都会有`导航栏`，会有一些`背景颜色`等

在开发当中，我们并不需要从零去搭建这种结构化的界面，我们可以使用Material库，直接使用其中的一些封装好的组件来完成一些结构的搭建。

* 使用脚手架搭建页面（自动适配）`Scaffold`

```java
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
//  1.调用runApp函数
//设置Text的排版方向
  runApp(
    MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text('我是头部bar标题'),
      )),
      body: Center(
        child: Text(
          "hello world",
          style: TextStyle(fontSize: 30, color: Colors.orange),
        ),
      ),
    )),
  );
}
```

在最外层包裹一个**MaterialApp**

- 这意味着整个应用我们都会采用MaterialApp风格的一些东西，方便我们对应用的设计，并且目前我们使用了其中两个属性；
- title：这个是定义在Android系统中打开多任务切换窗口时显示的标题；（暂时可以不写）
- home：是该应用启动时显示的页面，我们传入了一个Scaffold；

**Scaffold**是什么呢？

- 翻译过来是`脚手架`，脚手架的作用就是搭建页面的基本结构；
- 所以我们给MaterialApp的home属性传入了一个Scaffold对象，作为启动显示的Widget；
- Scaffold也有一些属性，比如`appBar`和`body`；
- appBar是用于设计导航栏的，我们传入了一个`title属性`；
- body是页面的内容部分，我们传入了之前已经创建好的Center中包裹的一个Text的Widget；

#### 2.3.3. 进阶案例实现

我们可以让界面中存在更多的元素：

- 写到这里的时候，你可能已经发现`嵌套太多`了，不要着急，我们后面会对代码重构的


### 2.4. 代码重构

#### 2.4.1. 创建自己的Widget

很多学习Flutter的人，都会被Flutter的`嵌套`劝退，当代码嵌套过多时，结构很容易看不清晰。

这里有两点我先说明一下：

- 1、Flutter整个开发过程中就是形成一个Widget树，所以形成嵌套是很正常的。
- 2、关于Flutter的代码缩进，更多开发中我们使用的是2个空格（前端开发2个空格居多，你喜欢4个也没问题）

但是，我们开发一个这么简单的程序就出现如此多的嵌套，如果应用程序更复杂呢？

- 我们可以对我们的代码进行封装，将它们封装到自己的Widget中，创建自己的Widget；

如何创建自己的Widget呢？

- 在Flutter开发中，我们可以继承自StatelessWidget或者StatefulWidget来创建自己的Widget类；
- **StatelessWidget：** 没有状态改变的Widget，通常这种Widget仅仅是做一些展示工作而已；
- **StatefulWidget：** 需要保存状态，并且可能出现状态改变的Widget；

在上面的案例中对代码的重构，我们使用StatelessWidget即可，所以我们接下来学习一下如果利用StatelessWidget来对我们的代码进行重构；

StatefulWidget我们放到后面的一个案例中来学习；

#### 2.4.2. StatelessWidget

StatelessWidget通常是一些没有状态（State，也可以理解成data）需要维护的Widget：

- 它们的数据通常是直接写死（放在Widget中的数据，必须被定义为final，为什么呢？我在下一个章节讲解StatefulWidget会讲到）；
- 从parent widget中传入的而且一旦传入就不可以修改；
- 从InheritedWidget获取来使用的数据（这个放到后面会讲解）；

我们来看一下创建一个StatelessWidget的格式：

- 1、让自己创建的Widget继承自StatelessWidget；
- 2、StatelessWidget包含一个必须重写的方法：build方法；


```c
class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return <返回我们的Widget要渲染的Widget，比如一个Text Widget>;
  }
}
```

**build方法的解析：**

- Flutter在拿到我们自己创建的StatelessWidget时，就会执行它的build方法；
- 我们需要在build方法中告诉Flutter，我们的Widget希望渲染什么元素，比如一个Text Widget；
- StatelessWidget没办法主动去执行build方法，当我们使用的数据发生改变时，build方法会被重新执行；

**build方法什么情况下被执行呢？：**

- 1、当我们的StatelessWidget第一次被插入到Widget树中时（也就是第一次被创建时）；
- 2、当我们的父Widget（parent widget）发生改变时，子Widget会被重新构建；
- 3、如果我们的Widget依赖InheritedWidget的一些数据，InheritedWidget数据发生改变时；

#### 2.4.3. 重构案例代码

现在我们就可以通过StatelessWidget来对我们的代码进行重构了

- 因为我们的整个代码都是一些数据展示，没有数据的改变，使用StatelessWidget即可；
- 另外，为了体现更好的封装性，我对代码进行了两层的拆分，让代码结构看起来更加清晰；（具体的拆分方式，我会在后面的案例中不断的体现出来，目前我们先拆分两层）

重构后的代码如下：

```c
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
//  1.调用runApp函数
//设置Text的排版方向
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  //如果子类不在具有子类，在继承抽象类时，子类必须重写实现父类的方法
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //返回要渲染的widget
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: MyWidgetBar()),
      body: MyWidgetBody(),
    ));
  }
}

class MyWidgetBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "hello world",
        style: TextStyle(fontSize: 30, color: Colors.orange),
      ),
    );
  }
}

class MyWidgetBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('我是头部bar标题'),
    );
  }
}
```

* 复选框值可改变，但是界面没改变

  * 因为使用的是无状态的Widget

  ```c
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  
  main(List<String> args) {
    runApp(MyWidget());
  }
  
  class MyWidget extends StatelessWidget {
    //如果子类不在具有子类，在继承抽象类时，子类必须重写实现父类的方法
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      //返回要渲染的widget
      return MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: MyWidgetBar()),
            body: MyWidgetBody(),
          ));
    }
  }
  
  class MyWidgetBody extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      //注意：这里的Row其实是居中显示的，但是Row中的Text相对与Row不是居中的，如果先让Row中的组件居中，需要进行如下操作
      // mainAxisAlignment:主轴
      //crossAxisAlignment:交叉轴
      return Center(
          child:Row(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Checkbox(value:true,onChanged:(value)=>print(value)),
              Text(
                "同意协议",
                style: TextStyle(fontSize: 30, color: Colors.orange),
              ),
            ],
          )
      );
    }
  }
  
  class MyWidgetBar extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Center(
        child: Text('我是头部bar标题'),
      );
    }
  }
  ```

> **在flutter开发中，所有的Widget都不能定义状态**，因为Widget上添加了`@immutable`,所以这个类一旦定义了，就不可变了

## 三. 案例练习

> 视图变化，必须使用`setState()`

* 案例1：
* 同意协议的复选框制作

```java
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
//  1.调用runApp函数
//设置Text的排版方向
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  //子类必须重新父类的方法
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //返回要渲染的widget
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: MyWidgetBar()),
          body: MyCheckboxWidget(),
        ));
  }
}

//StatefulWidget不能定义状态，但是可以创建一个单独的类，负责维护状态
class MyCheckboxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //返回定义的状态类
    return CheckboxState();
  }
}

//定义一个状态类，保存状态
//因为State是一个泛型类，必须要指定一个继承自StatefulWidget的泛型类。
class CheckboxState extends State<MyCheckboxWidget> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
                value: this.value,
                onChanged: (value) {
                  //如果状态名和value属性不同命，就可以不加this
                  //视图发生变化，必须调用setState方法（与React一样）
                  setState(() {
                    this.value = value as bool;
                  });
                }),
            Text(
              "同意协议",
              style: TextStyle(fontSize: 30, color: Colors.orange),
            ),
          ],
        ));
  }
}

class MyWidgetBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('我是头部bar标题'),
    );
  }
}

```



案例2：Statelesswidget综合案例

```java
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String>args){
  runApp(MyWidget());
}
class MyWidget extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatelessWidget(),
    );
  }
}
class MyStatelessWidget  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyAppBar(),
      ),
      body:MyAppBody() ,
    );
  }
}
class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child:Text("我是appBar"));
  }
}
//在Widget中定义的所有的成员变量类型都是final的
class MyAppBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ListView(
        children:<Widget>[
          MyAppBodyItem('杨幂','三生三世十里桃花','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_match%2F0%2F11962604349%2F0.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641093619&t=767ea728678b9d24cfc8c5d6e8ce93be'),
          SizedBox(height: 8,),//垂直方向的间距,相当于margin
          MyAppBodyItem('杨紫','香蜜','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201902%2F22%2F20190222225232_wslwm.thumb.700_0.jpg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641104397&t=2305967c263d362830c24e52d2fd41cd'),
          SizedBox(height: 8,),//垂直方向的间距,相当于margin
          MyAppBodyItem('杨幂','古剑奇谭','https://img2.baidu.com/it/u=3090368693,92741464&fm=26&fmt=auto'),
        ],
    );
  }
}
class MyAppBodyItem extends StatelessWidget {
final String title;
final String des;
final String imgUrl;
//构造函数成员变量进行初始化
MyAppBodyItem(this.title,this.des,this.imgUrl);
  //这个地方是全局，调用类的时候创建
  @override
  Widget build(BuildContext context) {
    // 这个地方是局部，每次条用函数的时候重新创建
    final titleStyle=TextStyle(color: Colors.orange,fontSize: 25);
    final desStyle=TextStyle(color: Colors.blueAccent,fontSize: 20);
    return Container(
      //设置padding
      padding: EdgeInsets.all(8),
      //设置边框
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.lightBlueAccent,
        ),
      ),
      child: Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: <Widget>[
            Text(title,style: titleStyle,),
            SizedBox(height: 8,),//垂直方向的间距,相当于margin
            Text(des,style: desStyle,),
            Image.network(imgUrl)
          ],
        ),
      ),
    );
  }
}
```



