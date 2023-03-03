import 'dart:async';

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
  late StreamSubscription listener;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var controller = PlayerController();
    var carouselController = CarouselController();

    int currentIndex = 0;

    // TODO :: animate to previous page when only 2 songs in album, end of page.
    listener = appState.player.currentIndexStream.listen((playerIdx) {
      if (playerIdx == null) throw Error();

      if (widget.id == appState.albumIndex) {
        if (playerIdx != currentIndex) {
          currentIndex = playerIdx;
        }
      } else {
        currentIndex = 0;
      }
      carouselController.animateToPage(currentIndex);
    }, cancelOnError: true);

    return CarouselSlider(
      options: CarouselOptions(
        height: 1000,
        viewportFraction: 0.45,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        scrollDirection: Axis.vertical,
        // enableInfiniteScroll: false,
        initialPage: currentIndex,
        onPageChanged: (index, reason) {
          currentIndex = index;
        },
      ),
      carouselController: carouselController,
      items: widget.album.musics
          .asMap()
          .entries
          .map((e) => MusicCover(
                albumIdx: widget.id,
                musicIdx: e.key,
                image: AssetImage(e.value.coverImage),
              ))
          .toList(),
    );
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }
}

class MusicCover extends StatelessWidget {
  const MusicCover({
    super.key,
    required this.albumIdx,
    required this.musicIdx,
    required this.image,
  });

  final int albumIdx;
  final int musicIdx;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var controller = PlayerController();

    // TODO :: make button style when music playing or not.
    ButtonStyle buttonStyle;
    if (appState.player.playing) {
      buttonStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        elevation: 10,
      );
    } else {
      buttonStyle = ButtonStyle(
        padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
      );
    }

    return ElevatedButton(
      style: buttonStyle,
      onPressed: () {
        controller.toggleButton(albumIdx, musicIdx);
      },
      child: Image(
        image: image,
      ),
    );
  }
}
