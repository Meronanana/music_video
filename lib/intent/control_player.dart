import 'package:just_audio/just_audio.dart';
import 'package:music_videos/model/app_state.dart';

class PlayerController {
  final player = AppState().player;

  void setPlayer() async {
    await player.stop();
    await player.setAsset('assets/audios/sample.mp3');
    await player.setVolume(0.2);
    player.setLoopMode(LoopMode.one);
    player.play();
  }

  void toggleButton() {
    if (player.playing) {
      player.stop();
    } else {
      player.play();
    }
  }
}
