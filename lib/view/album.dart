import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../intent/control_player.dart';
import '../model/app_state.dart';

class Album extends StatefulWidget {
  const Album({super.key});

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var controller = PlayerController();

    var page = 0;

    // @TODO :: make button style when music playing or not.
    ButtonStyle buttonStyle;
    if (appState.player.playing) {
      buttonStyle = ButtonStyle();
    } else {
      buttonStyle = ButtonStyle();
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 1000,
        viewportFraction: 0.45,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        scrollDirection: Axis.vertical,
        initialPage: page,
        onPageChanged: (index, reason) {
          page = index;
        },
      ),
      items: appState.album
          .map((e) => OutlinedButton(
                style: buttonStyle,
                onPressed: () {
                  controller.toggleButton(page);
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
