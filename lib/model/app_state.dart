import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;
  AppState._internal();

  var player = AudioPlayer();
  var isPlaying = true;

  void notify() {
    notifyListeners();
  }
}
