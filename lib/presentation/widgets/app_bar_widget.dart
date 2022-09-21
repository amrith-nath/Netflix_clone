import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight10,
        Row(
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
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                      image: AssetImage("assets/images/hero.jpg"),
                      fit: BoxFit.cover)),
            ),
            kwidth,
          ],
        ),
      ],
    );
  }
}
