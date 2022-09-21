import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/presentation/home/widget/home_appbar_widget.dart';
import 'package:netflix/presentation/home/widget/home_section.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, scroll, widget) {
              return Stack(
                children: [
                  NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      final ScrollDirection direction = notification.direction;

                      if (direction == ScrollDirection.reverse) {
                        scrollNotifier.value = false;
                      } else if (direction == ScrollDirection.forward) {
                        scrollNotifier.value = true;
                      }

                      return true;
                    },
                    child: ListView(
                      children: [
                        Stack(
                          children: [
                            const HomeTileImageWidget(),
                            const HomeTileGradiantWidget(),
                            Positioned(
                              bottom: 6,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _sideButton(
                                      icon: Icons.add, label: "My List"),
                                  _playButton(),
                                  _sideButton(
                                      icon: Icons.info_outline_rounded,
                                      label: "Info"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        kheight20,
                        const HomeSection(title: "Released In the past year"),
                        const HomeSection(
                          title: 'Trending Now',
                          showTopTen: true,
                        ),
                        const HomeSection(
                          title: "Top 10 Tv Shows In India today",
                          showNumber: true,
                        ),
                        const HomeSection(title: "Tense Dramas"),
                        const HomeSection(title: "South Indian Movies"),
                      ],
                    ),
                  ),
                  AnimatedSwitcher(
                      switchInCurve: Curves.easeOutSine,
                      switchOutCurve: Curves.easeInToLinear,
                      duration: const Duration(milliseconds: 600),
                      child: scrollNotifier.value
                          ? const HomeAppBarWidget()
                          : const SizedBox()),
                ],
              );
            }));
  }

  Column _sideButton({required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: whiteColor,
        ),
        Text(label),
      ],
    );
  }

  ElevatedButton _playButton() {
    return ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow_sharp,
          size: 35,
          color: backgroundColor,
        ),
        label: const Text(
          'Play',
          style: TextStyle(
              fontSize: 18,
              color: backgroundColor,
              fontWeight: FontWeight.w600),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(whiteColor)));
  }
}

class HomeTileImageWidget extends StatelessWidget {
  const HomeTileImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(mainImage), fit: BoxFit.fill)),
    );
  }
}

class HomeTileGradiantWidget extends StatelessWidget {
  const HomeTileGradiantWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          radius: 0.99,
          colors: [Colors.transparent, backgroundColor],
        ),
      ),
    );
  }
}
