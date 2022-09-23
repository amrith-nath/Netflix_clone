import 'package:flutter/material.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/newandhot_button_widget.dart';
import 'coming_soon_image_widget.dart';
import 'newandhot_body_text.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  const EveryOnesWatchingWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return EveryOnesWidget(
          size: size,
          index: index,
        );
      },
    );
  }
}

class EveryOnesWidget extends StatelessWidget {
  const EveryOnesWidget({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        height: 470,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ComingSoonImageWidget(size: size, image: comingSoonImage),
                volumeOffButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 150,
                  height: 86,
                  child: Image(image: NetworkImage(movieLogoImage)),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      innerImageButtons(
                          text: 'Share',
                          icon: Icons.send,
                          size: 30,
                          angle: -170,
                          diff: 6),
                      innerImageButtons(
                          text: 'My List', icon: Icons.add, size: 35),
                      innerImageButtons(
                          text: 'Play', icon: Icons.play_arrow, size: 35),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                kwidth,
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: 25,
                    child: Image.asset("assets/images/netflix_film.png"),
                  ),
                  Text(
                    "Movie Name $index",
                    style: const TextStyle(
                        color: whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  kheight5,
                  const NewAndHotBodeyText(
                    text:
                        "Landing the lead in the musical school is a\ndream come true for Jodi, untill the pleasure\nsends her confidence-and her relationship-\ninto a tailspin",
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
