import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/data/tasks_provider.dart';
import 'package:todo_app/screens/dashboard_screen.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/on_boarding_screen.dart';
import 'package:todo_app/screens/register_screen.dart';
import 'package:todo_app/screens/splash_screen.dart';
import 'package:todo_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Constants.kPrimaryColor,
            background: Constants.kBgBolor,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Constants.kLightGreyColor,
          ),
          buttonTheme: const ButtonThemeData(
            buttonColor: Constants.kPrimaryColor,
            textTheme: ButtonTextTheme.normal,
          ),
          datePickerTheme: const DatePickerThemeData(
            backgroundColor: Constants.kLightGreyColor,
          ),
          dialogTheme:
              const DialogTheme(backgroundColor: Constants.kLightGreyColor),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            labelLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            bodySmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          appBarTheme: const AppBarTheme(
            color: Constants.kBgBolor,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          useMaterial3: true,
        ),
        routes: {
          SplashScreen.route: (context) => const SplashScreen(),
          OnBoardingScreen.route: (context) => const OnBoardingScreen(),
          WelcomeScreen.route: (context) => const WelcomeScreen(),
          LoginScreen.route: (context) => const LoginScreen(),
          RegisterScreen.route: (context) => const RegisterScreen(),
          DashboardScreen.route: (context) => const DashboardScreen(),
        },
        home: const SplashScreen(),
      ),
    );
  }
}
