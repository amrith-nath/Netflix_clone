import 'package:flutter/material.dart';

class NewAndHotBodeyText extends StatelessWidget {
  const NewAndHotBodeyText({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
