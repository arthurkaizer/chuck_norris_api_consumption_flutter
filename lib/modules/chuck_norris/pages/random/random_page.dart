import 'package:chucknorris_api/common/errors.dart';
import 'package:chucknorris_api/common/widgets/custom_app_bar_widget.dart';
import 'package:chucknorris_api/modules/chuck_norris/models/chuck_joke_model.dart';
import 'package:chucknorris_api/modules/chuck_norris/pages/jokes/components/Joke_body_widget.dart';
import 'package:chucknorris_api/modules/chuck_norris/pages/random/random_joke_controller.dart';
import 'package:flutter/material.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({ Key? key }) : super(key: key);

  @override
  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  final _controller = RandomJokeController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Random Joke',),
      body: FutureBuilder<ChuckJokeModel>(
        future: _controller.getRandomJoke(),
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