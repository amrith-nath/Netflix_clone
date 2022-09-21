import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

import '../../../core/constants/constants.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [0.3, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            backgroundColor,
            Colors.transparent,
            // whiteColor
          ],
        ),
      ),
      child: Column(
        children: [
          kheight10,
          Row(
            children: [
              kwidth,
              SizedBox(
                  height: 55,
                  child: Image.asset("assets/images/netflix_PNG15.png")),
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
          SizedBox(
            height: 35,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "TV Shows",
                      style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Movies",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Categories",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
