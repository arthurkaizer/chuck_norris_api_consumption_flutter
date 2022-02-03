import 'package:chucknorris_api/common/errors.dart';
import 'package:chucknorris_api/modules/chuck_norris/models/chuck_joke_model.dart';
import 'package:dio/dio.dart';
import '../../../common/const/base_constants.dart' as consts;

class ChuckJokeRepository{
  final Dio _dio = Dio();
  Future<ChuckJokeModel> fetchChuckJokeModel ({required String category}) async{
    try {
      final response = await _dio.get("${consts.urlBase}/jokes/random?category=$category");
      return ChuckJokeModel.fromJson(response.data);
    } on DioError catch(e){
      throw HttpClientError(message: e.message, statusCode:  e.response?.statusCode??500);
    }
    catch (e) {
      throw RepositoryFailure(message: e.toString());
    }
  }
}