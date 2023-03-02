import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_videos/model/music.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();

  factory AppState() => _instance;
  AppState._internal();

  AudioPlayer player = AudioPlayer();
  List<Album> shelf = [
    Album([
      Music('assets/images/sample.jpg', 'assets/audios/sample.mp3'),
      Music('assets/images/sample2.jpg', 'assets/audios/sample2.mp3'),
    ]),
    Album([
      Music('assets/images/sample3.jpeg', 'assets/audios/sample3.mp3'),
      Music('assets/images/sample4.png', 'assets/audios/sample4.mp3'),
    ]),
    Album([
      Music('assets/images/sample5.jpg', 'assets/audios/sample5.mp3'),
      Music('assets/images/sample6.jpeg', 'assets/audios/sample6.mp3'),
    ]),
  ];

  List<Music> album = [
    Music('assets/images/sample3.jpeg', 'assets/audios/sample3.mp3'),
    Music('assets/images/sample4.png', 'assets/audios/sample4.mp3'),
    Music('assets/images/sample5.jpg', 'assets/audios/sample5.mp3'),
  ];

  int albumIndex = 0;

  void notify() {
    notifyListeners();
  }
}
