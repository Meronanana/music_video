class Music {
  final coverImage;
  final musicSource;

  Music(this.coverImage, this.musicSource);
}

class Album {
  List<Music> musics;

  Album(this.musics);
}
