import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_videos/local_notification.dart';
import 'package:music_videos/view/set_alarm.dart';

class NewLobby extends StatelessWidget {
  const NewLobby({super.key});

  @override
  Widget build(BuildContext context) {
    LocalNotification.testNotification();

    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/iPhoneSizeBG.jpg'),
            color: Color.fromARGB(69, 133, 133, 133).withOpacity(0.7),
            colorBlendMode: BlendMode.modulate,
          ),
          Center(
              child: ElevatedButton(
            onPressed: () {
              showCupertinoModalPopup<DateTime?>(
                context: context,
                builder: (context) => SetAlarm(isTutorial: false),
              ).then((value) {
                // TODO: 알람 생성하기
              });
            },
            child: Text('알람 설정하기'),
          )),
        ],
      ),
    );
  }
}
