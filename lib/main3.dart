import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import '01_basic/37_CustomLocalizations.dart';
//多语言-组件
import '01_basic/34_Calendar.dart';
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(CustomLocalizations.of(context)!.translate("title"));
    return MaterialApp(
      // title: '任务管理器中的标题',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            // Localizations.of(context, CustomLocalizations)!.translate("title"),
            // CustomLocalizations.of(context).title,
            "首页"
          ),
          centerTitle: true,
        ),
        body: Home(),
      ),
      theme: ThemeData(fontFamily: 'SourceSansPro'),
      debugShowCheckedModeBanner: false, //是否显示左上角调试标志
    //  国际化
      localizationsDelegates: [
        //  自定义代理
        // CustomLocalizations.delegate,
      //  本地化代理：指定哪些组件需要国际化
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

      ],
      supportedLocales: [
        // 支持得语言
        const Locale('en', 'US'), // English
        const Locale('he', 'IL'), // Hebrew
        const Locale('zh', 'CN'), // China
      ],

    );
  }
}
