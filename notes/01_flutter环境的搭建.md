# flutter环境的搭建

* [博客来源](https://blog.csdn.net/sunbinkang/article/details/106935636)

##  flutter是什么？

Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。也就是一个**跨平台解决方案**（移动、web、桌面）

## 安装Flutter

* [下载地址](https://flutter.dev/docs/development/tools/sdk/releases#windows)

## 配置环境变量（windows）

1.右键“我的电脑”-->属性-->高级系统设置-->环境变量

* flutterSDK环境变量配置：找到path并双击-->点击新建将下列路径复制进去
  * `D:\softWare\flutter_windows_2.5.3-stable\flutter\bin`
* DartSDK环境变量配置：找到path并双击-->点击新建将下列路径复制进去
  * `D:\softWare\flutter_windows_2.5.3-stable\flutter\bin\cache\dart-sdk\bin`

2.对于国内开发者创建项目可能会卡在Create flutter .. 底部显示 building Symbols...状态。
查看Console会提示Got socket error trying to find package at http://pub.dartlang.org，所以我们增加两个用户变量

`FLUTTER_STORAGE_BASE_URL`：`https://storage.flutter-io.cn`

`PUB_HOSTED_URL`：`https://pub.flutter-io.cn`

## flutter相关命令

1.执行如下命令，可以查看是否还有需要安装的依赖。同时第一次使用flutter命令也可以检查你环境变量是否配置好了。

​	`flutter doctor`

2.flutter -h (查看flutter命令的一下帮助)

3.flutter --version（注意是 --version 查看flutter版本）

4.flutter upgrade （flutter升级）

##  Android studio安装Flutter和Dart插件

1.打开Android studio，按照下面的步骤：file--》settings--》plugins--》分别输入框输入flutter和dart 点击install就行了

## 创建flutter项目

* `flutter create 项目名称必须小写`

* `flutter run`运行项目

## 报错处理

`Running Gradle task 'assembleDebug'...`

处理方法：在android/build.gradle文件中将全局替换

`google()`换成`maven { url 'https://maven.aliyun.com/repository/google' }`

`jcenter()`换成`maven { url 'https://maven.aliyun.com/repository/jcenter' }`

```
 repositories {
//        google()
        maven { url 'https://maven.aliyun.com/repository/google' }

        maven { url 'https://maven.aliyun.com/repository/jcenter' }

        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }

        maven {url 'http://download.flutter.io'}
        mavenCentral()
    }

```

```
allprojects {
    repositories {
//        google()
        maven { url 'https://maven.aliyun.com/repository/google' }

        maven { url 'https://maven.aliyun.com/repository/jcenter' }

        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }

        maven {url 'http://download.flutter.io'}
        mavenCentral()
    }
}
```

## 项目是否成功启动

如果模拟器上可以出现一个计数器，只要点击加号就能添加那就是成功了
