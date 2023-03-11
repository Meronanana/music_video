import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetFirstAlarm extends StatefulWidget {
  const SetFirstAlarm({super.key});

  @override
  State<SetFirstAlarm> createState() => _SetFirstAlarmState();
}

class _SetFirstAlarmState extends State<SetFirstAlarm> {
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
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
