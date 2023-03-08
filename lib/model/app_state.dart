import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_videos/model/music.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();

  factory AppState() => _instance;
  AppState._internal();

  AudioPlayer player = AudioPlayer();
  List<Album> shelf = [
    Album(musics: [
      Music(
        coverImage: 'assets/images/sample.jpg',
        musicSource: 'assets/audios/sample.mp3',
      ),
      Music(
        coverImage: 'assets/images/sample2.jpg',
        musicSource: 'assets/audios/sample2.mp3',
      ),
    ]),
    Album(musics: [
      Music(
          coverImage: 'assets/images/sample3.jpeg',
          musicSource: 'assets/audios/sample3.mp3'),
      Music(
        coverImage: 'assets/images/sample4.png',
        musicSource: 'assets/audios/sample4.mp3',
      ),
    ]),
    Album(musics: [
      Music(
        coverImage: 'assets/images/sample5.jpg',
        musicSource: 'assets/audios/sample5.mp3',
      ),
      Music(
        coverImage: 'assets/images/sample6.jpeg',
        musicSource: 'assets/audios/sample6.mp3',
      ),
    ]),
  ];

  int albumIndex = 0;

  void notify() {
    notifyListeners();
  }
}
