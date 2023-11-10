import 'package:flutter/material.dart';
import 'package:todo_app/models/onboarding.dart';
import 'package:todo_app/screens/welcome_screen.dart';
import 'package:todo_app/widget/my_elevated_button.dart';
import 'package:todo_app/widget/my_text_button.dart';
import 'package:todo_app/widget/screen_padding.dart';
import 'package:todo_app/widget/stepper.dart';

class OnBoardingScreen extends StatefulWidget {
  static const route = '/onBoardingScreen';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;
  List<OnBoardingModel> screens = [
    OnBoardingModel(
      image: 'assets/screen2.png',
      title: 'Manage Your Tasks',
      subtitle:
          "You can easily manage all of your daily tasks in DoMe for free",
    ),
    OnBoardingModel(
      image: 'assets/screen3.png',
      title: 'Create Daily Routine',
      subtitle:
          "In Uptodo  you can create your personalized routine to stay productive",
    ),
    OnBoardingModel(
      image: 'assets/screen4.png',
      title: 'Organize your tasks',
      subtitle:
          "You can organize your daily tasks by adding your tasks into separate categories",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    OnBoardingModel selectedScreen = screens[index];
    return SafeArea(
      child: Scaffold(
        body: ScreenPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(selectedScreen.image),
              SizedBox(
                height: height * 0.05,
              ),
              MyStepper(kIndex: index),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                selectedScreen.title,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                selectedScreen.subtitle,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (index > 0)
                    MyTextButton(
                        onPressed: () {
                          if (index == 0) {
                          } else {
                            setState(() {
                              index--;
                            });
                          }
                        },
                        title: 'BACK'),
                  const Spacer(),
                  MyElevatedButton(
                    onPressed: () {
                      if (index == 2) {
                        Navigator.of(context).pushNamed(WelcomeScreen.route);
                      } else {
                        setState(() {
                          index++;
                        });
                      }
                    },
                    title: index == 2 ? "GET STARTED" : 'NEXT',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
