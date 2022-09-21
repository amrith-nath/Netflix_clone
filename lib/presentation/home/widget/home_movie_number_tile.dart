import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/widgets/top_ten_widget.dart';

class HomeMovieNumberTile extends StatelessWidget {
  const HomeMovieNumberTile({
    Key? key,
    this.showTopTen = false,
    required this.index,
  }) : super(key: key);

  final bool showTopTen;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            kwidth30,
            Container(
              width: 120,
              height: 200,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/4FAA18ZIja70d1Tu5hr5cj2q1sB.jpg'),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  showTopTen ? const TopTenWidget() : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: -35,
          child: BorderedText(
            strokeColor: whiteColor,
            strokeWidth: 5.0,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 150,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
