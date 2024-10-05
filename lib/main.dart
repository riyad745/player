import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _play = false;
  void play() {
    setState(() {
      _play = !_play;
    });
  }

  Audio buildKey(int soundNumber) {
    return Audio('assets/audios/$soundNumber.mp3');
  }

  Widget container(Color color, int num, String text) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 9.29,
      color: color,
      child: ElevatedButton(
          onPressed: () {
            setState(
              () {
                AssetsAudioPlayer.newPlayer().open(
                  buildKey(num),
                  autoStart: true,
                  showNotification: true,
                );
              },
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              container(Colors.red, 1, "A"),
              container(Colors.blue, 2, "B"),
              container(Colors.yellow, 3, "C"),
              container(Colors.green, 4, "D"),
              container(Colors.pink, 5, "E"),
              container(Colors.grey, 6, "F"),
              container(Colors.orange, 7, "G"),
              container(Colors.black, 8, "H"),
              container(Colors.deepPurple, 9, "I"),
            ],
          ),
        ),
      ),
    );
  }
}
