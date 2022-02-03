import 'package:chucknorris_api/common/errors.dart';
import 'package:chucknorris_api/common/widgets/custom_app_bar_widget.dart';
import 'package:chucknorris_api/modules/chuck_norris/models/chuck_joke_model.dart';
import 'package:chucknorris_api/modules/chuck_norris/pages/jokes/joke_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'components/Joke_body_widget.dart';

class JokePage extends StatefulWidget {
  final String category;
  const JokePage({Key? key, required this.category}) : super(key: key);

  @override
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  final _controller = JokeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Joke - ${widget.category}',
      ),
      body: FutureBuilder<ChuckJokeModel>(
        future: _controller.getRandomJokeFromCategory(category: widget.category),
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
              
              return Stack(
                children: [
                  JokeBodyWidget(displayJoke: snapshot.data),
                ],
              );
            }else{
              if(snapshot.error is HttpClientError){
                var erro = snapshot.error as HttpClientError;
                return Text(erro.statusCode?.toString()??'');
              }
              if(snapshot.error is RepositoryFailure){
                var erro = snapshot.error as RepositoryFailure;
                return Text(erro.message??'');
              }else{
                return Text(snapshot.error.toString());
              }
            }
          }
        },
      ),
    );
  }
}
