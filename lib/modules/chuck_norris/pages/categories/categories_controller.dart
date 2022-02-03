import 'package:chucknorris_api/modules/chuck_norris/models/chuck_category_model.dart';
import 'package:chucknorris_api/modules/chuck_norris/repositories/chuck_category_repository.dart';

class CategoriesController{
  final _repository = ChuckCategoryRepository();

  Future<List<ChuckCategoryModel>> getJokesCategory() async{
    return await _repository.fetchChuckCategoryModel().onError((error, stackTrace) => throw Error());
  }
}