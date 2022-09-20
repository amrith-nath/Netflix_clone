import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';

class Searchresult extends StatelessWidget {
  const Searchresult({Key? key}) : super(key: key);

  final String imageUrl =
      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/cYLRSQSnZM99ptgE8W8JHMidwIf.jpg';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
            child: GridView.count(
                childAspectRatio: 1 / 1.6,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                children: List.generate(
                    20,
                    (index) => MainCard(
                          image: imageUrl,
                          size: size,
                        ))))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({required this.image, required this.size, Key? key})
      : super(key: key);

  final String image;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [],
      ),
    );
  }
}
