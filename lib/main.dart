import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(OverlaySupport.global(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Global Popup Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Global Popup Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Delay the popup by 5 seconds
            Future.delayed(Duration(seconds: 5), () {
              showOverlayPopup(context);
            });
          },
          child: Text('Show Popup After 5 Seconds'),
        ),
      ),
    );
  }

  void showOverlayPopup(BuildContext context) {
    showOverlay((context, t) {
      return Opacity(
        opacity: t,
        child: Material(
          color: Colors.black54,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'This is the transcription of the spoken command.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );
    }, duration: Duration(seconds: 5));
  }
}
