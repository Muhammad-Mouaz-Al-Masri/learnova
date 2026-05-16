import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learnova/screens/start/Welcome_Screens.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  bool start = false;
  bool up = false;
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        start = true;
      });
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        up = true;
      });
    });
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreens()),
      );
    });
    Future.delayed(Duration(seconds: 3), () {
      startAudio();
    });
  }

  void startAudio() async {
    audioPlayer = AudioPlayer();
    await audioPlayer.play(AssetSource('audio/WelcomingAudio.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: ListView(
            children: [
              SizedBox(height: 150),
              AnimatedContainer(
                height: start == false ? 1 : 500,
                width: start == false ? 1 : 400,
                duration: Duration(seconds: 3),
                child: Image.asset('assets/logo.png'),
              ),
            ],
          ),
        ),
        AnimatedAlign(
          alignment: up == false ? Alignment.bottomCenter : Alignment.center,
          duration: Duration(seconds: 2),
          child: Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 125, 78, 243),
            highlightColor: Colors.grey,
            child: Text(
              '                        Learn smarter,grow smarter',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
