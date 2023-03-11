import 'package:flutter/material.dart';
import 'package:music_videos/intent/fetch_data.dart';
import 'package:music_videos/intent/router_controller.dart';
import 'package:music_videos/view/lobby.dart';
import 'package:music_videos/view/welcome.dart';
import 'package:provider/provider.dart';

import '../model/app_state.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    if (appState.tutorial) {
      return Welcome();
    } else {
      return Lobby();
    }
  }
}
