import 'package:flutter/material.dart';

class Lobby extends StatelessWidget {
  const Lobby({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Video',
      home: SizedBox(
        width: 594,
        height: 1287,
        child: Stack(
          children: const [
            Image(image: AssetImage('assets/images/iPhoneSizeBG.JPG')),
            Center(
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}
