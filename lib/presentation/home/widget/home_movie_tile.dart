import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/top_ten_widget.dart';

class HomeMovieTile extends StatelessWidget {
  const HomeMovieTile({
    Key? key,
    this.showTopTen = false,
  }) : super(key: key);

  final bool showTopTen;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
