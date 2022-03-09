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
