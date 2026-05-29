import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  const CommonButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.buttonStyle,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(text, style: textStyle),
    );
  }
}
