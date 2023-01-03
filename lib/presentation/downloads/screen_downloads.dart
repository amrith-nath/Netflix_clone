import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/core/strings/strings.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/top_ten_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final List<Widget> listWidgets = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppBarWidget()),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 20,
        ),
        itemBuilder: (BuildContext context, int index) => listWidgets[index],
        itemCount: listWidgets.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  // final List imageList = [
  //   "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/4FAA18ZIja70d1Tu5hr5cj2q1sB.jpg",
  //   "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/bcCBq9N1EMo3daNIjWJ8kYvrQm6.jpg",
  //   "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/cYLRSQSnZM99ptgE8W8JHMidwIf.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context).add(
        const DownloadsEvent.getDownloadsImage(),
      );
    });
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing Downloads for You",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        kheight,
        const _GreyText(
          text:
              "We will download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
        ),
        BlocBuilder<DownloadsBloc, DownloadState>(
          builder: (context, state) {
            return SizedBox(
                height: size.width,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: state.downloads!.isNotEmpty
                      ? [
                          CircleAvatar(
                            radius: size.width * 0.37,
                            backgroundColor: Colors.white.withOpacity(0.3),
                          ),
                          ImageContainerWidget(
                            size: size * 0.9,
                            image:
                                "$imageAppendUrl${state.downloads![0].posterPath}",
                            margin: const EdgeInsets.only(left: 180),
                            angle: 20,
                          ),
                          ImageContainerWidget(
                            size: size * 0.9,
                            image:
                                "$imageAppendUrl${state.downloads![1].posterPath}",
                            margin: const EdgeInsets.only(right: 180),
                            angle: -20,
                          ),
                          ImageContainerWidget(
                            size: size,
                            image:
                                "$imageAppendUrl${state.downloads![2].posterPath}",
                            margin: const EdgeInsets.only(top: 20),
                            angle: 0,
                            topTen: const TopTenWidget(),
                          )
                        ]
                      : [
                          SizedBox(
                            height: size.width * 0.2,
                            width: size.width * 0.2,
                            child: const CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          ),
                        ],
                ));
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Set Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
    );
  }
}

class _GreyText extends StatelessWidget {
  const _GreyText({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(children: const [
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
      ]),
    );
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
