import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';

class NewAndHotAppBarWidget extends StatelessWidget {
  const NewAndHotAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "New & Hot",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      actions: [
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kwidth,
        Container(
          height: 20,
          width: 30,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              image: DecorationImage(
                  image: AssetImage("assets/images/hero.jpg"),
                  fit: BoxFit.cover)),
        ),
        kwidth,
      ],
      bottom: const TabBar(tabs: [
        Tab(
          text: "🍿Coming Soon",
        ),
        Tab(
          text: "👀Everyone's Watching",
        ),
      ]),
    );
  }
}
