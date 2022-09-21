import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/home/widget/home_movie_number_tile.dart';
import 'package:netflix/presentation/home/widget/home_movie_tile.dart';

class MainHomeMovieWidget extends StatelessWidget {
  const MainHomeMovieWidget({
    this.showNumber = false,
    this.showTopTen = false,
    Key? key,
  }) : super(key: key);

  final bool showNumber;
  final bool showTopTen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            !showNumber ? kwidth : const SizedBox(),
        separatorBuilder: (context, index) => !showNumber
            ? HomeMovieTile(
                showTopTen: showTopTen,
              )
            : HomeMovieNumberTile(
                showTopTen: showTopTen,
                index: index,
              ),
        itemCount: 10,
      ),
    );
  }
}
