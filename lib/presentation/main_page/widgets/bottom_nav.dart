import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

// ignore: must_be_immutable
class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (BuildContext context, int value, Widget? child) {
        return BottomNavigationBar(
          currentIndex: value,
          onTap: (newIndex) {
            indexChangeNotifier.value = newIndex;
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_collection_outlined),
                label: 'New & Hot'),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_outlined),
                label: 'Fast Laughs'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.download_for_offline_rounded),
                label: 'Downloads'),
          ],
        );
      },
    );
  }
}
