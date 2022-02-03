import 'package:chucknorris_api/modules/chuck_norris/pages/categories/categories_page.dart';
import 'package:chucknorris_api/modules/chuck_norris/pages/jokes/joke_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final routes = <String,WidgetBuilder>{
      '/' : (context) => CategoriesPage(),
      '/joke': (context) => JokePage(category: settings.arguments as String,),
    };
    WidgetBuilder? builder = routes[settings.name!];
    return MaterialPageRoute(builder: (ctx) => builder!(ctx), settings: settings);
  }

}