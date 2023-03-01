import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_videos/intent/control_player.dart';
import 'package:music_videos/model/app_state.dart';

class Lobby extends StatelessWidget {
  const Lobby({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PlayerController();

    controller.setPlayer();

    return MaterialApp(
      title: 'Music Video',
      home: SizedBox(
        width: 594,
        height: 1287,
        child: Stack(
          children: [
            Image(image: AssetImage('assets/images/iPhoneSizeBG.JPG')),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  controller.toggleButton();
                },
                child: Placeholder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
