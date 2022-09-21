import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText({required this.title, Key? key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
