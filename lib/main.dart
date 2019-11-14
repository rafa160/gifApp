import 'package:flutter/material.dart';
import 'package:give_me_gifs/screens/home/gif_page.dart';
import 'package:give_me_gifs/screens/login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get your Gifs',
      debugShowCheckedModeBanner: false,
      home: GifPage(),
      theme: ThemeData(hintColor: Colors.white),
    );
  }
}
