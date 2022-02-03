import 'package:chucknorris_api/common/widgets/custom_app_bar_widget.dart';
import 'package:chucknorris_api/modules/chuck_norris/models/chuck_category_model.dart';
import 'package:chucknorris_api/modules/chuck_norris/pages/categories/categories_controller.dart';
import 'package:flutter/material.dart';

import 'components/list_categories_widget.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({ Key? key }) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _controller = CategoriesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Chuck Norris - Categories',),
      body: FutureBuilder<List<ChuckCategoryModel>>(
        future: _controller.getJokesCategory(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.none:
              return Text('=(');
            default:
            if(snapshot.hasData){
              
              return ListCategoriesWidget(categories: snapshot.data??[]);
            }else{
              if(snapshot.error is Exception){
                return Text('erro');
              }else{
                return Text('outra coisa');
              }
            }
          }
        },
      ),
    );
  }
}
