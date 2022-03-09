import 'dart:math';

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
  late Animation sizeAnimation;
  late Animation colorAnimation;
  late Animation rotateAnimation;

  @override
  // 初始化动画
  void initState() {
    super.initState();
    //1. 创建AnimationController
    controller = AnimationController(
      duration: Duration(seconds: 3), //执行时间
      vsync:
          this, //this是当前的状态组件对象。能直接使用this的原因是后面会使用SingleTickerProviderStateMixin
    );
    /*****************************************************************************************

    // createTicker的作用是通知组件一帧一帧的更新动画
    //  2.给动画控制器声明动画曲线
    animation = CurvedAnimation(parent: controller, curve: Interval(0.0, 0.5));
    //  3.监听动画
    animation.addListener(() {
      print("当前动画的值:${animation.value}");
      setState(() {});
    });

    *****************************************************************************************/
    // 以上两步合成一步
    //2.创建动画
    // Interval：每个动画的时间间隔
    animation = CurvedAnimation(parent: controller, curve: Interval(0.0, 0.5))
      ..addListener(() {
        setState(() {});
      });
    //3.让动画反复运行
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //   如果动画执行结束，反向执行动画
        controller.reverse(); //反向执行动画
      } else if (status == AnimationStatus.dismissed) {
        //  如果动画处于开始的状态，正向执行动画
        controller.forward(); //执行动画
      }
    });
    //  4.设置其他动画
    sizeAnimation = Tween(begin: 0.0, end: 200.0).animate(animation);
    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.red).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.8, curve: Curves.bounceIn)))
      ..addListener(() {
        setState(() {});
      });
    rotateAnimation = Tween(begin: 0.0, end: 2 * pi).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.8, 1.0, curve: Curves.easeIn)))
      ..addListener(() {
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.stop(); //停止执行动画
                },
                child: Text("停止"),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.forward(); //执行动画
                },
                child: Text("重复"),
              ),
            ],
          ),
          Opacity(
            opacity: controller.value,
            child: Transform.rotate(
              angle: rotateAnimation.value,
              child: Container(
                width: sizeAnimation.value,
                height: sizeAnimation.value,
                color: colorAnimation.value,
              ),
            ),
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
