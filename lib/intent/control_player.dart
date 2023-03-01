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
    await player.setAudioSource(
      ConcatenatingAudioSource(
        useLazyPreparation: true,
        children: appState.album
            .map((e) => AudioSource.asset(e.musicSource))
            .toList(),
      ),
    );
    await player.setVolume(0.2);
    player.setLoopMode(LoopMode.all);
    player.play();
    appState.notify();
  }

  void toggleButton(index) {
    if (index == player.currentIndex) {
      if (player.playing) {
        player.pause();
      } else {
        player.play();
      }
    } else {
      player.seek(Duration.zero, index: index);
      if (!player.playing) {
        player.play();
      }
    }
  }

  void snapAlbumPage(index) {
    player.seek(Duration.zero, index: index);
  }
}
