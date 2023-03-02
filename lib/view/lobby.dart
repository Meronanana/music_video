import 'package:flutter/material.dart';
import 'package:music_videos/intent/control_player.dart';
import 'package:music_videos/model/app_state.dart';
import 'package:music_videos/view/album_widget.dart';
import 'package:music_videos/view/shelf_widget.dart';
import 'package:provider/provider.dart';

class Lobby extends StatelessWidget {
  const Lobby({super.key});

  @override
  Widget build(BuildContext context) {
    PlayerController();

    return MaterialApp(
      title: 'Music Video',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(113, 191, 69, 162),
        ),
      ),
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

    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/iPhoneSizeBG.jpg'),
            color: Color.fromARGB(69, 133, 133, 133).withOpacity(0.7),
            colorBlendMode: BlendMode.modulate,
          ),
          Center(
            child: ShelfWidget(),
          ),
        ],
      ),
    );
  }
}
