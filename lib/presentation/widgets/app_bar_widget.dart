import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        const Text(
          "Downloads",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        // SizedBox(
        //   child: Image.asset("assets/images/logoPNG.png"),
        // ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kwidth,
        Container(
          height: 30,
          width: 30,
          color: Colors.blue,
        ),
        kwidth,
      ],
    );
  }
}
