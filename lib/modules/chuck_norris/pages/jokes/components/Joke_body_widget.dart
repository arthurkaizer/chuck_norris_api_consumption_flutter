import 'package:chucknorris_api/modules/chuck_norris/models/chuck_joke_model.dart';
import 'package:flutter/material.dart';

class JokeBodyWidget extends StatelessWidget {
  final ChuckJokeModel? displayJoke;
  const JokeBodyWidget({Key? key, required this.displayJoke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        Container(
          child: Image.network(displayJoke?.iconUrl ?? ''),
        ),
        Padding(padding: EdgeInsets.all(10), child: Text(displayJoke?.joke??''))
      ]),
    );
  }
}
