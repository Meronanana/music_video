import 'package:flutter/material.dart';
import 'package:music_videos/intent/player_controller.dart';
import 'package:music_videos/intent/fetch_data.dart';
import 'package:music_videos/model/app_state.dart';
import 'package:music_videos/view/shelf_widget.dart';
import 'package:provider/provider.dart';

class Lobby extends StatelessWidget {
  const Lobby({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FetchData.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Image(
              image: AssetImage('assets/images/iPhoneSizeBG.jpg'),
              color: Color.fromARGB(69, 133, 133, 133).withOpacity(0.7),
              colorBlendMode: BlendMode.modulate,
            );
          } else {
            return LobbyScreen();
          }
        });
  }
}

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var controller = PlayerController();
    print(appState.shelf.first.musics.toString());

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
