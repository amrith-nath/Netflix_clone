import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';

const String searchTileImage =
    "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/nKDvDVSaFFBrQr0NoPiyasEN8Mk.jpg";

class SearchIdle extends StatelessWidget {
  const SearchIdle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const SearchTextTitle(
          title: "Top Search",
        ),
        kheight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 20,
            separatorBuilder: (BuildContext context, int index) {
              return kheight;
            },
            itemBuilder: (BuildContext context, int index) {
              return const SearchItemTile();
            },
          ),
        ),
      ],
    );
  }
}

class SearchTextTitle extends StatelessWidget {
  const SearchTextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

class SearchItemTile extends StatelessWidget {
  const SearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,
          width: 120,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            image: DecorationImage(
              image: NetworkImage(searchTileImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Text(
          "Movie Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: whiteColor,
          size: 45,
        )
      ],
    );
  }
}
