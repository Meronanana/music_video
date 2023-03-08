import 'package:cloud_firestore/cloud_firestore.dart';

class Music {
  String coverImage; // image link
  String musicSource; // music link

  Music({required this.coverImage, required this.musicSource});
}

class Album {
  List<Music> musics;

  Album({required this.musics});
}
