import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/widget/main_home_movie_widget.dart';
import '../../../core/constants/constants.dart';
import 'main_text.dart';

class HomeSection extends StatelessWidget {
  const HomeSection(
      {required this.title,
      this.showTopTen = false,
      this.showNumber = false,
      Key? key})
      : super(key: key);
  final String title;
  final bool showTopTen;
  final bool showNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MainText(
            title: title,
          ),
        ),
        kheight,
        MainHomeMovieWidget(
          showNumber: showNumber,
        ),
        kheight,
      ],
    );
  }
}
