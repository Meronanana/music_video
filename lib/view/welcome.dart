import 'package:flutter/material.dart';
import 'package:music_videos/intent/router_controller.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 171, 171, 171),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome!'),
            ElevatedButton(
              onPressed: () => RouterController().tutorialDone(),
              child: Text('Done!'),
            )
          ],
        ),
      ),
    );
  }
}
