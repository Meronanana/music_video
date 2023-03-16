import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_videos/firebase_options.dart';
import 'package:music_videos/intent/fetch_data.dart';
import 'package:music_videos/local_notification.dart';
import 'package:music_videos/model/app_state.dart';
import 'package:music_videos/view/router.dart';
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

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

  await LocalNotification.initialize();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Seoul'));

  FetchData.fetchData();

  // runApp(const Lobby());
  runApp(const Init());
}

class Init extends StatelessWidget {
  const Init({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Video',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(113, 191, 69, 162),
        ),
      ),
      home: ChangeNotifierProvider(
        create: (context) => AppState(),
        child: AppRouter(),
      ),
    );
  }
}
