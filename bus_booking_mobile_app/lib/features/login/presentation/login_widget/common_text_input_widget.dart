import 'package:flutter/material.dart';

class CommonTextInputWidget extends StatelessWidget {
  final String text;
  final String label;
  final Function(String) onChanged;
  final TextStyle? textStyle;
  final bool status;
  const CommonTextInputWidget({
    super.key,
    required this.text,
    required this.label,
    required this.onChanged,
    this.textStyle,
    this.status = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: textStyle,
      obscureText: status,
      decoration: InputDecoration(
        hintText: text,
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}