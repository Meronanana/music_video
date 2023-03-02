import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:music_videos/model/music.dart';
import 'package:provider/provider.dart';

import '../intent/control_player.dart';
import '../model/app_state.dart';

class AlbumWidget extends StatefulWidget {
  const AlbumWidget({super.key, required this.id, required this.album});
  final int id;
  final Album album;

  @override
  State<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var controller = PlayerController();
    var carouselController = CarouselController();

    var currentIndex = 0;

    // TODO :: make button style when music playing or not.
    ButtonStyle buttonStyle;
    if (appState.player.playing) {
      buttonStyle = ButtonStyle();
    } else {
      buttonStyle = ButtonStyle();
    }

    // TODO :: animate to previous page when only 2 songs in album, end of page.
    // TODO :: resolve unhandled error - 'Null check operator used on a null value'
    appState.player.sequenceStateStream.listen((sq) {
      if (sq != null) {
        if (widget.id == appState.albumIndex) {
          if (sq.currentIndex != currentIndex) {
            currentIndex = sq.currentIndex;
          }
        } else {
          currentIndex = 0;
        }
        carouselController.animateToPage(currentIndex);
      }
    });

    return CarouselSlider(
      options: CarouselOptions(
        height: 1000,
        viewportFraction: 0.45,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        scrollDirection: Axis.vertical,
        initialPage: currentIndex,
        onPageChanged: (index, reason) {
          currentIndex = index;
        },
      ),
      carouselController: carouselController,
      items: widget.album.musics
          .map((e) => OutlinedButton(
                style: buttonStyle,
                onPressed: () {
                  controller.toggleButton(currentIndex);
                },
                child: Image(
                  width: 300,
                  image: AssetImage(e.coverImage),
                ),
              ))
          .toList(),
    );
  }
}
