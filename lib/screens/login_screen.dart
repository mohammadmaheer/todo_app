import 'package:flutter/material.dart';
import 'package:todo_app/screens/dashboard_screen.dart';
import 'package:todo_app/screens/register_screen.dart';
import 'package:todo_app/widget/add_height.dart';
import 'package:todo_app/widget/my_app_bar.dart';
import 'package:todo_app/widget/my_elevated_button.dart';
import 'package:todo_app/widget/my_text_button.dart';
import 'package:todo_app/widget/my_text_form_field.dart';
import 'package:todo_app/widget/screen_padding.dart';

class LoginScreen extends StatelessWidget {
  static const route = "/loginScreen";
  const LoginScreen({super.key});

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
              "Login",
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
            const AddHeight(percentage: 0.07),
            MyElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(DashboardScreen.route);
                },
                title: 'Login'),
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
              title: 'Login with Google',
              isTransparent: true,
            ),
            const AddHeight(percentage: 0.01),
            MyElevatedButton(
              onPressed: () {},
              title: 'Login with Apple',
              isTransparent: true,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: MyTextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RegisterScreen.route);
                },
                title: 'Don\'t have an account? Register',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
