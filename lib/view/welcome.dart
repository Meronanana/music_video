import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_videos/intent/router_controller.dart';
import 'package:music_videos/model/app_state.dart';
import 'package:music_videos/view/set_alarm.dart';
import 'package:provider/provider.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 171, 171, 171),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                '잠깐 차분히 생각해봅시다.\n이른 아침, 창밖에서 햇살이 들어옵니다.\n새들이 노래합니다.\n이어서 노랫소리가 들려옵니다.\n당신은 자연스레 잠에서 깨어납니다.\n이 모습을 누군가 본다면,\n마치 \'뮤직비디오\' 같다고 하지 않을까요?'),
            ElevatedButton(
              onPressed: () {
                showCupertinoModalPopup<DateTime?>(
                  context: context,
                  builder: (context) => SetAlarm(isTutorial: appState.tutorial),
                ).then((value) {
                  // 알람 생성하기
                  RouterController().tutorialDone();
                });
              },
              child: Text('알람 설정하기'),
            )
          ],
        ),
      ),
    );
  }
}
