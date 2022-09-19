import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/4FAA18ZIja70d1Tu5hr5cj2q1sB.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/bcCBq9N1EMo3daNIjWJ8kYvrQm6.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/cYLRSQSnZM99ptgE8W8JHMidwIf.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          const _SmartDownloads(),
          const Text(
            "Introducing Downloads for You",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          _GreyText(
            text: "We will download a personalised selection of",
          ),
          _GreyText(
            text: "movies and shows for you, so there's",
          ),
          _GreyText(
            text: "always something to watch on your",
          ),
          _GreyText(
            text: "device",
          ),
          SizedBox(
            height: size.width,
            width: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.37,
                  backgroundColor: Colors.white.withOpacity(0.3),
                ),
                ImageContainerWidget(
                  size: size * 0.9,
                  image: imageList[2],
                  margin: const EdgeInsets.only(left: 180),
                  angle: 20,
                ),
                ImageContainerWidget(
                  size: size * 0.9,
                  image: imageList[1],
                  margin: const EdgeInsets.only(right: 180),
                  angle: -20,
                ),
                ImageContainerWidget(
                  size: size,
                  image: imageList[0],
                  margin: const EdgeInsets.only(top: 20),
                  angle: 0,
                  topTen: const TopTenWidget(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SizedBox(
              height: 45,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Set Up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              height: 45,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(whiteColor),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "See What You Can Download",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: backgroundColor),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class _GreyText extends StatelessWidget {
  _GreyText({
    required this.text,
    Key? key,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.grey,
        fontSize: 16,
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      kwidth,
      Icon(
        Icons.settings,
        color: whiteColor,
      ),
      kwidth,
      Text(
        "Smart Downloads",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    Key? key,
    required this.size,
    required this.image,
    required this.margin,
    required this.angle,
    this.topTen = const SizedBox(),
  }) : super(key: key);

  final Size size;
  final String image;
  final EdgeInsets margin;
  final double angle;
  final Widget topTen;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        height: size.width * 0.6,
        width: size.width * 0.35,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              color: Colors.black,
              blurRadius: 5.0,
            ),
          ],
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            topTen,
          ],
        ),
      ),
    );
  }
}

class TopTenWidget extends StatelessWidget {
  const TopTenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 30,
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(-2, 2),
              color: Colors.black,
              blurRadius: 5.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "TOP",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          Text(
            "10",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
