import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_videos/model/music.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();

  factory AppState() => _instance;
  AppState._internal();

  AudioPlayer player = AudioPlayer();
  List<Music> album = [
    Music('assets/images/sample.jpg', 'assets/audios/sample.mp3'),
    Music('assets/images/sample2.jpg', 'assets/audios/sample2.mp3'),
  ];

  void notify() {
    notifyListeners();
  }
}
