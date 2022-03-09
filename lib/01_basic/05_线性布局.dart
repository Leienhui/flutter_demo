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
