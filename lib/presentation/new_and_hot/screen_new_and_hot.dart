import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_widget.dart';

import '../../core/constants/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/hero.jpg"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
            kwidth,
          ],
          bottom: const TabBar(
              padding: EdgeInsets.symmetric(horizontal: 20),
              unselectedLabelColor: whiteColor,
              labelColor: backgroundColor,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              indicator: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(60))),
              tabs: [
                Tab(
                  text: "🍿Coming Soon",
                ),
                Tab(
                  text: "👀Everyone's Watching",
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            buildCommingSoon(text: "tab 1", context: context),
            const EveryOnesWatchingWidget(
              text: "tab 2",
            )
          ],
        ),
      ),
    );
  }
}
