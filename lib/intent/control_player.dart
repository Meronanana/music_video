import 'package:just_audio/just_audio.dart';
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
            .map((e) => AudioSource.asset(e.musicSource))
            .toList(),
      ),
    );
    await player.setVolume(0.2);
    await player.setLoopMode(LoopMode.all);
  }

  Future<void> play() => player.play();

  void toggleButton(albumIdx, musicIdx) async {
    if (albumIdx != appState.albumIndex) {
      appState.albumIndex = albumIdx;
      await _initPlayer();
    }

    if (musicIdx == player.currentIndex) {
      if (player.playing) {
        player.pause();
      } else {
        player.play();
      }
    } else {
      player.seek(Duration.zero, index: musicIdx);
      if (!player.playing) {
        player.play();
      }
    }
  }

  void snapShelfWidget(index) {
    appState.albumIndex = index;
    print(index);
  }

  void snapAlbumPage(index) {
    player.seek(Duration.zero, index: index);
  }
}
