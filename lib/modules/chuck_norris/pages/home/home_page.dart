import 'package:chucknorris_api/common/widgets/custom_app_bar_widget.dart';
import 'package:chucknorris_api/modules/chuck_norris/pages/home/components/button_home_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Chuck Norris Jokes',
      ),
      body: Column(
        children: [
          ButtonHomeWidget(
            route: 'random',
            title: 'Random',
          ),
          ButtonHomeWidget(
            route: 'categories',
            title: 'Categories',
          ),
        ],
      ),
    );
  }
}
