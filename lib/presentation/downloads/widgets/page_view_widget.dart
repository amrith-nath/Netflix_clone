import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index + 1 % Colors.accents.length],
        ),
        //*left side
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.6),
              radius: 30,
              child: const Icon(
                CupertinoIcons.volume_off,
                shadows: [
                  Shadow(
                    offset: Offset(0, 3),
                    color: Colors.black,
                    blurRadius: 18.0,
                  ),
                ],
              ),
            ),
          ),
        ),
//*right side

        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                // Stack(children: const [
                //   CircleAvatar(
                //     radius: 30,
                //     backgroundImage: NetworkImage(
                //         'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/cYLRSQSnZM99ptgE8W8JHMidwIf.jpg'),
                //   ),
                //   Padding(
                //     padding: EdgeInsets.only(
                //       top: 65,
                //       left: 5,
                //     ),
                //     child: Text(
                //       'Netflix',
                //       style: TextStyle(
                //           fontFamily: "BebasNeue",
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20),
                //     ),
                //   )
                // ]),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/cYLRSQSnZM99ptgE8W8JHMidwIf.jpg'),
                ),
                Text(
                  'Netflix',
                  style: TextStyle(
                    fontFamily: "BebasNeue",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                VideoActions(icon: Icons.emoji_emotions_rounded, title: "LOL"),
                VideoActions(icon: Icons.add, title: "My List"),
                VideoActions(icon: Icons.share, title: "Share"),
                VideoActions(icon: Icons.play_arrow_rounded, title: "Play"),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  const VideoActions({required this.icon, required this.title, Key? key})
      : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: whiteColor,
            shadows: const [
              Shadow(
                offset: Offset(0, 3),
                color: Colors.black,
                blurRadius: 20.0,
              ),
            ],
          ),
          kheight5,
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
