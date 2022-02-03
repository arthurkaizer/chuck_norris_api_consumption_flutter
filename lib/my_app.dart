import 'package:chucknorris_api/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: chuckThemedata,
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
    );
  }

  final ThemeData chuckThemedata = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: Color(0xFFF15B24),
    iconTheme: IconThemeData(
      color: Color(0xFFF15B24),
    ),
  );
}
