import 'package:flutter/material.dart';
import 'package:music_videos/intent/control_player.dart';
import 'package:music_videos/model/app_state.dart';
import 'package:provider/provider.dart';

class Lobby extends StatelessWidget {
  const Lobby({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PlayerController();

    return MaterialApp(
      title: 'Music Video',
      home: ChangeNotifierProvider(
        create: (context) => AppState(),
        child: LobbyScreen(),
      ),
    );
  }
}

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var controller = PlayerController();

    return SizedBox(
      width: 594,
      height: 1287,
      child: Stack(
        children: [
          Image(image: AssetImage('assets/images/iPhoneSizeBG.JPG')),
          Center(
            child: SizedBox(
              width: 300,
              height: 200,
              child: OutlinedButton(
                onPressed: () {
                  controller.toggleButton();
                },
                child: Text(appState.player.playing ? 'Pause' : 'Play'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
