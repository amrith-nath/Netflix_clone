import 'package:flutter/material.dart';
import 'package:netflix/core/themes/themes.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.themeData,
      home: ScreenMainPage(),
    );
  }
}
