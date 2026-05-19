import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:learnova/main.dart';
import 'package:learnova/screens/Authentication/sign_up.dart';
import 'package:learnova/statemangment/signup_state.dart';
import 'package:learnova/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class WelcomeScreens extends StatelessWidget {
  const WelcomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return IntroductionScreen(
      onSkip: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => SignupState(),
            child: SignUp(),
          ),
        ),
      ),
      skip: Text('skip'),
      bodyPadding: EdgeInsets.only(top: height / 3.5),
      showSkipButton: true,
      showNextButton: false,
      showDoneButton: false,
      onDone: () {}, // ✅ مطلوب حتى لو كان showDoneButton: false
      done: const Text(''), // ✅ مطلوب حتى لو كان مخفيًا

      pages: [
        PageViewModel(
          titleWidget: Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: AppTheme.primaryColor,
            child: Text(
              'The Best Teachers',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          bodyWidget: Text(
            "We partner with the world's finest educators.Each instructor brings years of real-world expertise.They are passionate about sharing their knowledge with youLearn from the best and accelerate your career today.",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
            textAlign: TextAlign.center,
          ),
          image: LottieBuilder.asset(
            'assets/animations/Online Learning Blue.json',
            width: width * 0.9,
            height: height / 2,
          ),
        ),

        //////////////////////////////////////////////////////// 1
        PageViewModel(
          titleWidget: Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: AppTheme.primaryColor,
            child: Text(
              'Learn from Any Where',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          bodyWidget: Text(
            'Learn from anywhere and earn the most valuable skills. Shape your own success through mastering the highest-quality courses available. Expand your expertise with expert-led training that fits your schedule, and unlock new opportunities to grow both personally and professionally in todays competitive world.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
            textAlign: TextAlign.center,
          ),
          image: LottieBuilder.asset(
            'assets/animations/learning.json',
            width: width * 0.9,
            height: height / 2,
          ),
        ),

        ///////////////////////////////////////
        PageViewModel(
          titleWidget: Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: AppTheme.primaryColor,
            child: Text(
              'Ask AI',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          bodyWidget: Text(
            'Ask the AI scientific questions about complex topics like quantum mechanics, astrophysics, molecular biology, or climate science, and receive detailed, accurate explanations tailored to your level of understanding',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
            textAlign: TextAlign.center,
          ),
          image: LottieBuilder.asset(
            'assets/animations/Ai-powered marketing tools abstract.json',
            width: width * 0.9,
            height: height / 2,
          ),
        ),

        ///////////////////////////////////// 2
        PageViewModel(
          titleWidget: Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: AppTheme.primaryColor,
            child: Text(
              'Earn certifications ',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          bodyWidget: Text(
            'Take exams, earn certifications, and validate your expertise with credentials that employers worldwide recognize and trust. Complete rigorous assessments designed by industry professionals, receive official certificates upon passing, and showcase your achievements to stand out in the job market. Build a portfolio of verified skills that opens doors to better career opportunities, higher salaries, and professional growth.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
            textAlign: TextAlign.center,
          ),
          image: LottieBuilder.asset(
            'assets/animations/Online Learning Blue.json',
            width: width * 0.9,
            height: height / 2,
          ),
        ),

        ////////////////////////////////////// 3
      ],
    );
  }
}
