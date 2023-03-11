import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_videos/firebase_options.dart';
import 'package:music_videos/view/lobby.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: "music-videos",
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    Firebase.app();
  }

  runApp(const Lobby());
}
