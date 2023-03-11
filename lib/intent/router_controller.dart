import 'package:music_videos/model/app_state.dart';

class RouterController {
  static final RouterController _instance = RouterController._constructor();

  factory RouterController() => _instance;
  RouterController._constructor();

  final appState = AppState();

  void tutorialDone() {
    appState.tutorial = false;
    appState.notify();
  }
}
