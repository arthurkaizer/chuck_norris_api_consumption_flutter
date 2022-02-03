import 'package:chucknorris_api/modules/chuck_norris/models/chuck_category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListCategoriesWidget extends StatelessWidget {
  final List<ChuckCategoryModel> categories;
  const ListCategoriesWidget({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          onTap: () => Navigator.of(context)
              .pushNamed('/joke', arguments: category.title),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xFFF15B24),
          ),
          title: Text(category.title),
        );
      },
    );
  }
}
