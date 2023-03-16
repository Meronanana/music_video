import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:music_videos/local_notification.dart';
import 'package:music_videos/view/music_cover_widget.dart';
import 'package:music_videos/view/set_alarm.dart';

class NewLobby extends StatelessWidget {
  const NewLobby({super.key});

  @override
  Widget build(BuildContext context) {
    LocalNotification.testSchedule();
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/iPhoneSizeBG.jpg'),
            color: Color.fromARGB(69, 133, 133, 133).withOpacity(0.7),
            colorBlendMode: BlendMode.modulate,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MusicCoverWidget(),
                ElevatedButton(
                  onPressed: () {
                    showCupertinoModalPopup<DateTime?>(
                      context: context,
                      builder: (context) => SetAlarm(isTutorial: false),
                    ).then(
                      (date) async {
                        print(date);
                        if (date != null) {
                          LocalNotification.setNotification(date);
                        }
                      },
                    );
                  },
                  child: Text('알람 설정하기'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
