import 'package:cloud_firestore/cloud_firestore.dart';

class Music {
  String imageUrl; // image link
  String musicUrl; // music link

  Music({required this.imageUrl, required this.musicUrl});
}

class Album {
  List<Music> musics;

  Album({required this.musics});
}
