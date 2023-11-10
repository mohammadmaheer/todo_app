import 'package:flutter/material.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/screens/calendar_screen.dart';
import 'package:todo_app/screens/focus_screen.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/user_screen.dart';
import 'package:todo_app/widget/add_task_bottom_modal.dart';

class DashboardScreen extends StatefulWidget {
  static const route = "/dashboardScreen";

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0;
  final pages = [
    const HomeScreen(),
    const CalendarScreen(),
    Container(),
    const FocusScreen(),
    const UserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return const AddTaskBottomModal();
            },
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Constants.kPrimaryColor,
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        selectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          color: Colors.white,
        ),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF363636),
        unselectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
        ),
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/home-2.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/calendar.png'),
            label: 'Calendar',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox(
              width: 10,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/clock.png'),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/user.png'),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[index],
    );
  }
}
