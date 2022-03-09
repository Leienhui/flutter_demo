import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
//本地化类
class CustomLocalizations{
  final Locale locale;
  CustomLocalizations(this.locale);
  static CustomLocalizations of(BuildContext context) {
    return Localizations.of<CustomLocalizations>(context, CustomLocalizations)!;
  }
  //翻译信息
  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Home',
      'content':'Hello'
    },
    'zh': {
      'title': '首页',
      'content':"您好"
    },
  };
  //翻译方法
  // String translate(String key){
  //   print(_localizedValues);
  //   return _localizedValues[locale.languageCode]![key]!;
  // }
  String get title {
    return _localizedValues[locale.languageCode]!['title']!;
  }
//  获取本地化代理
  static CustomLocalizationsDelegate delegate=CustomLocalizationsDelegate();

}



//本地化代理
class CustomLocalizationsDelegate extends LocalizationsDelegate<CustomLocalizations> {
  const CustomLocalizationsDelegate();
  //1. 当前环境的locale，是否在我们支持的语言范围内

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  //2.当前Localizations组件重新构建时，是否调用load方法，重新加载locale资源

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;

  //3.当locale发生变化时，加载对应的CustomLocalizations资源
  @override
  Future<CustomLocalizations> load(Locale locale) {
    return  SynchronousFuture<CustomLocalizations>(CustomLocalizations(locale));
  }

}