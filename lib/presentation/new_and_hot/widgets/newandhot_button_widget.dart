import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

Column innerImageButtons(
    {required String text,
    required IconData icon,
    double size = 25,
    double angle = 0,
    double diff = 0}) {
  return Column(
    children: [
      Transform.rotate(
        angle: angle,
        child: Icon(
          icon,
          color: whiteColor,
          size: size,
        ),
      ),
      SizedBox(
        height: diff,
      ),
      Text(
        text,
        style: const TextStyle(
            color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w400),
      ),
    ],
  );
}
