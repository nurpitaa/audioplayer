import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerWithURL extends StatefulWidget {
  const AudioPlayerWithURL({Key? key}) : super(key: key);

  @override
  State<AudioPlayerWithURL> createState() => _AudioPlayerWithURLState();
}

class _AudioPlayerWithURLState extends State<AudioPlayerWithURL> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  String url =
      'https://ia800504.us.archive.org/11/items/testmp3testfile/mpthreetest.mp3';

  @override
  void initState() {
    // TODO: implement initState

    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      setState(() {
        audioPlayerState = state;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }

  playMusic() async {
    await audioPlayer.play(url);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(audioPlayerState == AudioPlayerState.PLAYING
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded),
              onPressed: () {
                audioPlayerState == AudioPlayerState.PLAYING
                    ? pauseMusic()
                    : playMusic();
              })
        ],
      ),
    ));
  }
}
