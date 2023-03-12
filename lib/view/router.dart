import 'package:flutter/material.dart';
import 'package:music_videos/model/app_state.dart';
import 'package:music_videos/view/new_lobby.dart';
import 'package:music_videos/view/welcome.dart';
import 'package:provider/provider.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    // TODO: appState.tutorial은 AsyncStorage 통해서 업데이트 하기.
    if (appState.tutorial) {
      return Welcome();
    } else {
      return NewLobby();
    }
  }
}
