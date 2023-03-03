import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:music_videos/view/album_widget.dart';
import 'package:provider/provider.dart';

import '../intent/control_player.dart';
import '../model/app_state.dart';

class ShelfWidget extends StatefulWidget {
  const ShelfWidget({super.key});

  @override
  State<ShelfWidget> createState() => _ShelfWidgetState();
}

class _ShelfWidgetState extends State<ShelfWidget> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var controller = PlayerController();

    var currentIndex = 0;

    List<AlbumWidget> carouselItems = appState.shelf
        .asMap()
        .entries
        .map((e) => AlbumWidget(e.key, e.value))
        .toList();

    return CarouselSlider(
      options: CarouselOptions(
        height: 1000,
        viewportFraction: 0.75,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        // enableInfiniteScroll: false,
        initialPage: currentIndex,
        onPageChanged: (index, reason) {
          currentIndex = index;
          // controller.snapShelfWidget(currentIndex);
        },
      ),
      items: carouselItems,
      // items: [TestWidget(), TestWidget(), TestWidget()],
    );
  }
}
