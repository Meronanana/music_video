import 'package:just_audio/just_audio.dart';
import 'package:music_videos/intent/fetch_data.dart';
import 'package:music_videos/model/app_state.dart';

class PlayerController {
  static final PlayerController _instance = PlayerController._constructor();

  factory PlayerController() => _instance;
  PlayerController._constructor() {
    _initPlayer();
  }

  final appState = AppState();
  final player = AppState().player;

  Future<void> _initPlayer() async {
    await player.stop();
    await player.setAudioSource(
      ConcatenatingAudioSource(
        useLazyPreparation: true,
        children: appState.shelf[appState.albumIndex].musics
            .map((e) => AudioSource.uri(Uri.parse(e.musicUrl)))
            .toList(),
      ),
    );
    await player.setVolume(0.5);
    await player.setLoopMode(LoopMode.all);
  }

  Future<void> play() => player.play();

  void toggleButton() async {
    if (appState.shelf == []) {
      FetchData.fetchData();
    }

    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }
}
