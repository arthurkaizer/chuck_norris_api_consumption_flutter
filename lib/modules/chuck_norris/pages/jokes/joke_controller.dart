import 'package:chucknorris_api/modules/chuck_norris/models/chuck_joke_model.dart';
import 'package:chucknorris_api/modules/chuck_norris/repositories/chuck_joke_repository.dart';

class JokeController{
  final _repository = ChuckJokeRepository();

  Future<ChuckJokeModel> getRandomJokeFromCategory({required String category}) async{
    return await _repository.fetchChuckJokeModel(category: category);
  }
}