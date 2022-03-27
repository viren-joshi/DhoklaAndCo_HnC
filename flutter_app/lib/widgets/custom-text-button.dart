import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() onPressedCallback;
  final Color buttonBackgroundColor;
  final Color textColor;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressedCallback,
    this.buttonBackgroundColor = Colors.white,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: TextButton(
        onPressed: onPressedCallback,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
