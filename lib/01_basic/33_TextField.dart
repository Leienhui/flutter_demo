import 'package:flutter/material.dart';
import '37_CustomLocalizations.dart';
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
