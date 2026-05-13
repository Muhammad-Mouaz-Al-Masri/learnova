import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntroductionScreen(
        showSkipButton: false,
        showNextButton: false,
        showDoneButton: false,
        pages: [
          PageViewModel(
            title: "",
            body: "The best courses teached by expert teachers",
            image: LottieBuilder.asset(
              'assets/animations/Online Learning Blue.json',
              width: 400,
              height: 400,
            ),
          ),
          PageViewModel(
            title: "",
            body: "",
            image: LottieBuilder.asset(
              'assets/animations/Knowledge.json',
              width: 400,
              height: 400,
            ),
          ),
          PageViewModel(
            title: "",
            body: "",

            image: LottieBuilder.asset(
              'assets/animations/learning.json',
              width: 400,
              height: 400,
            ),
          ),
          PageViewModel(
            title: "",
            body: "Ask AI questions and get answers in no time ",
            image: LottieBuilder.asset(
              'assets/animations/Ai-powered marketing tools abstract.json',
              width: 400,
              height: 400,
            ),
          ),
        ],
      ),
    );
  }
}
