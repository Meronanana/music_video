import 'package:music_videos/intent/control_player.dart';
import 'package:music_videos/model/app_state.dart';
import 'package:music_videos/model/music.dart';

class FetchData {
  static Future<bool> fetchData() async {
    final appState = AppState();
    var shelfCollection = appState.firestore.collection('shelf');

    List<Music> tempAlbum = [];
    await shelfCollection.get().then((value) {
      for (var e in value.docs) {
        tempAlbum.add(Music(
            imageUrl: e.data()['imageUrl'], musicUrl: e.data()['musicUrl']));
      }
    });

    appState.shelf = [Album(musics: tempAlbum)];

    PlayerController();

    return true;
  }
}
