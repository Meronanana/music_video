import 'package:just_audio/just_audio.dart';
import 'package:music_videos/model/app_state.dart';

class PlayerController {
  static final PlayerController _instance = PlayerController._internal();
  factory PlayerController() => _instance;
  PlayerController._internal() {
    _initPlayer();
  }

  final appState = AppState();
  final player = AppState().player;

  void _initPlayer() async {
    await player.stop();
    await player.setAsset('assets/audios/sample.mp3');
    await player.setVolume(0.2);
    player.setLoopMode(LoopMode.one);
    player.play();
    appState.notify();
  }

  void toggleButton() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
    appState.notify();
  }
}
