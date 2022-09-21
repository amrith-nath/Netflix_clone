import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';

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
              labelColor: backgroundColor,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
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
            _buildCommingSoon(text: "tab 1", context: context),
            _buildEveryOnesWatching(text: "tab 2"),
          ],
        ),
      ),
    );
  }
}

Widget _buildCommingSoon(
    {required String text, required BuildContext context}) {
  return ListView.builder(
      itemCount: 10,
      itemBuilder: ((context, index) => ComingSoonWidget(
            index: index,
          )));
}

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({required this.index, Key? key}) : super(key: key);
  final List monthlists = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "JAN",
    "SEP",
    "OCT",
    "NOV",
  ];

  final int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: size.width * 0.15,
          child: Column(
            children: [
              Text(
                monthlists[index],
                style: newAndHotDatetextTile(grey: true),
              ),
              Text(
                "${index + 11}",
                style: newAndHotDatetextTile(),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          // color: Colors.grey.shade900,
          width: size.width * 0.85,
          height: 500,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    NewAndHotImageWidget(size: size, image: newAndHotImage),
                    volumeOffButton(),
                  ],
                ),
                kheight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TALL GIRL 2',
                      style: GoogleFonts.amaticSc(
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        innerImageButtons(
                            text: "Remind Me",
                            icon: Icons.notifications_outlined),
                        kwidth,
                        innerImageButtons(
                            text: "Info", icon: Icons.info_outline),
                        kwidth,
                      ],
                    ),
                  ],
                ),
                kheight5,
                const Text(
                  "Coming On Friday",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                kheight,
                SizedBox(
                  height: 25,
                  child: Image.asset("assets/images/netflix_film.png"),
                ),
                const Text(
                  "Tall Girl 2",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                kheight,
                const Text(
                  "Landing the lead in the musical school is a\ndream come true for Jodi, untill the pleasure\nsends her confidence-and her relationship-\ninto a tailspin",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Column innerImageButtons({required String text, required IconData icon}) {
  return Column(
    children: [
      Icon(
        icon,
        color: whiteColor,
        size: 25,
      ),
      Text(
        text,
        style: const TextStyle(
            color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w400),
      ),
    ],
  );
}

Positioned volumeOffButton() {
  return Positioned(
    bottom: 5,
    right: 10,
    child: CircleAvatar(
      backgroundColor: Colors.black.withOpacity(0.6),
      radius: 20,
      child: const Icon(
        CupertinoIcons.volume_off,
        shadows: [
          Shadow(
            offset: Offset(0, 3),
            color: Colors.black,
            blurRadius: 18.0,
          ),
        ],
      ),
    ),
  );
}

TextStyle newAndHotDatetextTile({bool grey = false}) {
  return TextStyle(
      fontFamily: "BebasNeue",
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: grey ? Colors.grey : whiteColor);
}

Widget _buildEveryOnesWatching({required String text}) {
  return Center(
    child: Text(text),
  );
}

class NewAndHotImageWidget extends StatelessWidget {
  const NewAndHotImageWidget({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.85,
      height: 220,
      decoration: BoxDecoration(
          color: whiteColor,
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }
}
