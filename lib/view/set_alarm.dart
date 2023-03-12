import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_videos/model/app_state.dart';
import 'package:provider/provider.dart';

class SetAlarm extends StatefulWidget {
  const SetAlarm({super.key, required this.isTutorial});

  final bool isTutorial;

  @override
  State<SetAlarm> createState() => _SetAlarmState();
}

class _SetAlarmState extends State<SetAlarm> {
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (t) => setState(() => time = t),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop<DateTime?>(context, time),
                  child: Text('완료'),
                ),
                if (!widget.isTutorial)
                  ElevatedButton(
                    onPressed: () => Navigator.pop<DateTime?>(context, null),
                    child: Text('취소'),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
