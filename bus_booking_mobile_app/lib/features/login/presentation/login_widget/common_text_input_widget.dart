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
      borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1.5),
    );

    return TextField(
      onChanged: onChanged,
      style: textStyle ?? const TextStyle(color: Color(0xFF0F172A), fontSize: 15),
      obscureText: status,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 15),
        labelText: label.isEmpty ? null : label,
        labelStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 15),
        floatingLabelStyle: const TextStyle(color: Color(0xFF0A66FF), fontSize: 15),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
        prefixIcon: prefixIcon != null 
            ? Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 12.0),
                child: Icon(prefixIcon, color: const Color(0xFF94A3B8), size: 22),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 24,
        ),
        suffixIcon: suffixWidget != null
            ? Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: suffixWidget,
              )
            : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 24,
        ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: Color(0xFF0A66FF), width: 1.5),
        ),
      ),
    );
  }
}