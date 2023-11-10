import 'package:flutter/material.dart';
import 'package:todo_app/screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/splashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushNamed(OnBoardingScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/screen1.png'),
            const Text('UpTodo'),
          ],
        ),
      )),
    );
  }
}
