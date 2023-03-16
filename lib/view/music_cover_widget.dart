import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_videos/intent/player_controller.dart';
import 'package:music_videos/model/app_state.dart';
import 'package:provider/provider.dart';

import '../model/music.dart';

class MusicCoverWidget extends StatefulWidget {
  const MusicCoverWidget({
    super.key,
  });

  @override
  State<MusicCoverWidget> createState() => _MusicCoverWidgetState();
}

class _MusicCoverWidgetState extends State<MusicCoverWidget> {
  late StreamSubscription listener;
  late Music music;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var controller = PlayerController();

    listener = appState.player.currentIndexStream.listen((playerIdx) {
      if (playerIdx == null) throw Error();

      setState(() {
        music = appState.shelf[appState.albumIndex].musics[playerIdx];
      });
    }, cancelOnError: true);

    // TODO :: make button style when music playing or not.
    ButtonStyle buttonStyle;
    if (appState.player.playing) {
      buttonStyle = ElevatedButton.styleFrom(
        fixedSize: const Size(300, 300),
        padding: EdgeInsets.zero,
        elevation: 20,
      );
    } else {
      buttonStyle = ElevatedButton.styleFrom(
        fixedSize: const Size(300, 300),
        padding: EdgeInsets.zero,
      );
    }

    return ElevatedButton(
      style: buttonStyle,
      onPressed: () {
        controller.toggleButton();
      },
      child: Image(
        image: NetworkImage(music.imageUrl),
      ),
    );
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }
}
