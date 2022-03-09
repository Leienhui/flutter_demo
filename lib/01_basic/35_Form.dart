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
