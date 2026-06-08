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
    final defaultStyle = ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 8,
      shadowColor: Theme.of(context).primaryColor.withAlpha(102),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle ?? defaultStyle,
      child: Text(text, style: textStyle),
    );
  }
}
