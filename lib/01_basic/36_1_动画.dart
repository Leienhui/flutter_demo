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
