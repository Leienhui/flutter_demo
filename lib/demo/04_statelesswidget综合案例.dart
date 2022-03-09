import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String>args){
  runApp(MyWidget());
}
class MyWidget extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatelessWidget(),
    );
  }
}
class MyStatelessWidget  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyAppBar(),
      ),
      body:MyAppBody() ,
    );
  }
}
class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child:Text("我是appBar"));
  }
}
//在Widget中定义的所有的成员变量类型都是final的
class MyAppBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ListView(
      children:<Widget>[
        MyAppBodyItem('杨幂','三生三世十里桃花','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_match%2F0%2F11962604349%2F0.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641093619&t=767ea728678b9d24cfc8c5d6e8ce93be'),
        SizedBox(height: 8,),//垂直方向的间距,相当于margin
        MyAppBodyItem('杨紫','香蜜','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201902%2F22%2F20190222225232_wslwm.thumb.700_0.jpg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641104397&t=2305967c263d362830c24e52d2fd41cd'),
        SizedBox(height: 8,),//垂直方向的间距,相当于margin
        MyAppBodyItem('杨幂','古剑奇谭','https://img2.baidu.com/it/u=3090368693,92741464&fm=26&fmt=auto'),
      ],
    );
  }
}
class MyAppBodyItem extends StatelessWidget {
  final String title;
  final String des;
  final String imgUrl;
//构造函数成员变量进行初始化
  MyAppBodyItem(this.title,this.des,this.imgUrl);
  //这个地方是全局，调用类的时候创建
  @override
  Widget build(BuildContext context) {
    // 这个地方是局部，每次条用函数的时候重新创建
    final titleStyle=TextStyle(color: Colors.orange,fontSize: 25);
    final desStyle=TextStyle(color: Colors.blueAccent,fontSize: 20);
    return Container(
      //设置padding
      padding: EdgeInsets.all(8),
      //设置边框
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.lightBlueAccent,
        ),
      ),
      child: Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: <Widget>[
            Text(title,style: titleStyle,),
            SizedBox(height: 8,),//垂直方向的间距,相当于margin
            Text(des,style: desStyle,),
            Image.network(imgUrl)
          ],
        ),
      ),
    );
  }
}
