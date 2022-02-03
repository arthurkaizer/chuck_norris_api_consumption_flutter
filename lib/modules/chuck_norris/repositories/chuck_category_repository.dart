import 'package:chucknorris_api/modules/chuck_norris/models/chuck_category_model.dart';
import 'package:dio/dio.dart';
import '../../../common/const/base_constants.dart' as consts;

class ChuckCategoryRepository{
  final Dio _dio = Dio();

  Future<List<ChuckCategoryModel>> fetchChuckCategoryModel () async{
    final response = await _dio.get("${consts.urlBase}/jokes/categories");
    return ChuckCategoryModel.fromJsonList(response.data);
  }
}