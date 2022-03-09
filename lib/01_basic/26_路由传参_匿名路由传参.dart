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
