import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? width;
  final double height;
  final bool isTransparent;
  const MyElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height = 40,
    this.isTransparent = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? MediaQuery.of(context).size.width, height),
        backgroundColor: isTransparent ? Colors.transparent : Colors.deepPurple,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isTransparent ? Colors.deepPurple : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
