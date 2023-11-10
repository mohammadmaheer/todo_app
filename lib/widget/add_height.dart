import 'package:flutter/material.dart';

class AddHeight extends StatelessWidget {
  final double percentage;
  const AddHeight({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * percentage,
    );
  }
}
