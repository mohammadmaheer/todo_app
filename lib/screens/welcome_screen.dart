import 'package:flutter/material.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/register_screen.dart';
import 'package:todo_app/widget/add_height.dart';
import 'package:todo_app/widget/my_app_bar.dart';
import 'package:todo_app/widget/my_elevated_button.dart';
import 'package:todo_app/widget/screen_padding.dart';

class WelcomeScreen extends StatelessWidget {
  static const route = '/welcomeScreen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(),
      body: ScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to UpTodo',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            const AddHeight(percentage: 0.04),
            Text(
              'Please login to your account or create new account to continue',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            MyElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.route);
              },
              title: 'LOGIN',
              height: 45,
              width: width,
            ),
            const AddHeight(
              percentage: 0.01,
            ),
            MyElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RegisterScreen.route);
              },
              title: 'CREATE ACCOUNT',
              width: width,
              height: 45,
              isTransparent: true,
            ),
          ],
        ),
      ),
    );
  }
}
