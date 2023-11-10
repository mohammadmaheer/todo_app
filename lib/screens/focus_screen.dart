import 'package:flutter/material.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/widget/add_height.dart';
import 'package:todo_app/widget/screen_padding.dart';

import '../widget/my_elevated_button.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  double _percentage = 0.0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(hours: 1),
    );

    _controller.addListener(() {
      setState(() {
        _percentage = _controller.value;
      });
    });
  }

  void _startStopTimer() {
    if (_isRunning) {
      _controller.stop();
    } else {
      _controller.reverse(
          from: _controller.value == 0.0 ? 1.0 : _controller.value);
    }

    setState(() {
      _isRunning = !_isRunning;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Focus Mode',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        body: ScreenPadding(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const AddHeight(
                  percentage: 0.02,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.5,
                      height: width * 0.5,
                      child: CircularProgressIndicator(
                        value: _percentage,
                        backgroundColor: Constants.kLightGreyColor,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Constants.kPrimaryColor),
                        strokeWidth: 10,
                      ),
                    ),
                    Text(
                      "${(_controller.duration!.inMinutes * (1 - _percentage)).ceil()}:${(_controller.duration!.inSeconds * (1 - _percentage)).ceil()}",
                      style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const AddHeight(percentage: 0.04),
                Text(
                  'While your focus mode is on, all of your notifications will be off',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const AddHeight(percentage: 0.02),
                MyElevatedButton(
                  width: width * 0.5,
                  onPressed: _startStopTimer,
                  title: _isRunning ? 'Stop' : 'Start',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
