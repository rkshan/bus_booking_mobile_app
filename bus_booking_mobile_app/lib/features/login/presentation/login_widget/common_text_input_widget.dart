import 'package:flutter/material.dart';

class CommonTextInputWidget extends StatelessWidget {
  final String text;
  final String label;
  final Function(String) onChanged;
  final TextStyle? textStyle;
  final bool status;
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final TextInputType? keyboardType;
  const CommonTextInputWidget({
    super.key,
    required this.text,
    required this.label,
    required this.onChanged,
    this.textStyle,
    this.status = false,
    this.prefixIcon,
    this.suffixWidget,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: BorderSide(color: Colors.grey.shade300),
    );

    return TextField(
      onChanged: onChanged,
      style: textStyle,
      obscureText: status,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: text,
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey[600]) : null,
        suffixIcon: suffixWidget,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}