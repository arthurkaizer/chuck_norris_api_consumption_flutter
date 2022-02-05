import 'package:flutter/material.dart';

class ButtonHomeWidget extends StatelessWidget {
  final String route;
  final String title;
  const ButtonHomeWidget({Key? key, required this.route, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center (child: Container(
      margin: EdgeInsets.all(30),
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () => {Navigator.pushNamed(context, '/$route')},
        child: Text(title),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          textStyle: const TextStyle(
            fontSize: 16,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
    ),
    );
  }
}
