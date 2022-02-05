import 'package:chucknorris_api/modules/chuck_norris/models/chuck_joke_model.dart';
import 'package:chucknorris_api/modules/chuck_norris/repositories/chuck_random_joke_repository.dart';

class RandomJokeController{
  final _repository = ChuckRandomJokeRepository();

  Future<ChuckJokeModel> getRandomJoke() async{
    return await _repository.fetchChuckJokeModel();
  }
}