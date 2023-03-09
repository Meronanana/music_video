import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_videos/model/music.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();

  factory AppState() => _instance;
  AppState._internal();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AudioPlayer player = AudioPlayer();

  List<Album> shelf = [];
  // List<Album> shelf = [
  //   Album(musics: [
  //     Music(
  //       imageUrl: 'assets/images/sample.jpg',
  //       musicUrl: 'assets/audios/sample.mp3',
  //     ),
  //     Music(
  //       imageUrl: 'assets/images/sample2.jpg',
  //       musicUrl: 'assets/audios/sample2.mp3',
  //     ),
  //   ]),
  //   Album(musics: [
  //     Music(
  //         imageUrl: 'assets/images/sample3.jpeg',
  //         musicUrl: 'assets/audios/sample3.mp3'),
  //     Music(
  //       imageUrl: 'assets/images/sample4.png',
  //       musicUrl: 'assets/audios/sample4.mp3',
  //     ),
  //   ]),
  //   Album(musics: [
  //     Music(
  //       imageUrl: 'assets/images/sample5.jpg',
  //       musicUrl: 'assets/audios/sample5.mp3',
  //     ),
  //     Music(
  //       imageUrl: 'assets/images/sample6.jpeg',
  //       musicUrl: 'assets/audios/sample6.mp3',
  //     ),
  //   ]),
  // ];

  int albumIndex = 0;

  void notify() {
    notifyListeners();
  }
}
