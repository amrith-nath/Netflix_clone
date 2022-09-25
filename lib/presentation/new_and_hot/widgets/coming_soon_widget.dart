import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';
import 'newandhot_body_text.dart';
import 'newandhot_button_widget.dart';

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
        SizedBox(
          width: size.width * 0.20,
          child: StickyHeader(
            header: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
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
            content: const SizedBox(
              height: 400,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          // color: Colors.grey.shade900,
          width: size.width * 0.80,
          height: 450,
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
                const NewAndHotBodeyText(
                  text:
                      "Landing the lead in the musical school is a\ndream come true for Jodi, untill the pleasure\nsends her confidence-and her relationship-\ninto a tailspin",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildCommingSoon({required BuildContext context}) {
  return ListView.builder(
      itemCount: 10,
      itemBuilder: ((context, index) => ComingSoonWidget(
            index: index,
          )));
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
      height: 180,
      decoration: BoxDecoration(
          color: whiteColor,
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }
}
