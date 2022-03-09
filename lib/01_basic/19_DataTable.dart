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
