import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/fast_laughs/screen_fast_laughs.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final List pages = [
    const ScreenHome(),
    ScreenNewAndHot(),
    const ScreenFastLaughs(),
    const ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (BuildContext context, int index, _) {
            return pages[index];
          },
        ),
        bottomNavigationBar: BottomNavigationWidget(),
      ),
    );
  }
}
