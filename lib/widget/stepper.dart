import 'package:flutter/material.dart';

class MyStepper extends StatelessWidget {
  final int kIndex;
  const MyStepper({super.key, required this.kIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) {
          bool isSelected = kIndex == index;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 4,
            width: 30,
            decoration: BoxDecoration(
              color: !isSelected ? Colors.grey : Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          );
        },
      ),
    );
  }
}
