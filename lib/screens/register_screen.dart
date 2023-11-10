import 'package:flutter/material.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/widget/my_app_bar.dart';

import '../widget/add_height.dart';
import '../widget/my_elevated_button.dart';
import '../widget/my_text_button.dart';
import '../widget/my_text_form_field.dart';
import '../widget/screen_padding.dart';
import 'dashboard_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const route = "/registerScreen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: const MyAppBar(),
      body: ScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Register",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const AddHeight(percentage: 0.03),
            MyTextFormField(
              label: 'Username',
              controller: usernameController,
              hint: 'Enter your username',
            ),
            const AddHeight(percentage: 0.02),
            MyTextFormField(
              label: 'Password',
              controller: passwordController,
              hint: 'Enter Password',
            ),
            const AddHeight(percentage: 0.02),
            MyTextFormField(
              label: 'Confirm Password',
              controller: passwordController,
              hint: 'Enter Password again',
            ),
            const AddHeight(percentage: 0.07),
            MyElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(DashboardScreen.route);
                },
                title: 'Register'),
            const AddHeight(percentage: 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width * 0.4, child: const Divider()),
                const Text('or'),
                SizedBox(width: width * 0.4, child: const Divider()),
              ],
            ),
            const AddHeight(percentage: 0.04),
            MyElevatedButton(
              onPressed: () {},
              title: 'Register with Google',
              isTransparent: true,
            ),
            const AddHeight(percentage: 0.01),
            MyElevatedButton(
              onPressed: () {},
              title: 'Register with Apple',
              isTransparent: true,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: MyTextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(LoginScreen.route);
                },
                title: 'Already have an account? Login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
