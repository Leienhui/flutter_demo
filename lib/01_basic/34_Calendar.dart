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
