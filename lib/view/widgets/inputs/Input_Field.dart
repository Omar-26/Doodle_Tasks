import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;
  final void Function()? onFieldSubmitted;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType keyboardType;

  const InputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.validator,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        filled: true,
        fillColor: tdGrey,
        errorStyle: const TextStyle(color: tdRed),
        focusedBorder: _getBorder(),
        focusedErrorBorder: _getBorder(isError: true),
        enabledBorder: _getBorder(),
        errorBorder: _getBorder(isError: true),
        hintText: hintText,
        hintStyle: GoogleFonts.karla(
          textStyle: const TextStyle(
            color: tdtextColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        // Prefix icon
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: prefix,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 22,
          minHeight: 22,
        ),
        // Suffix icon
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: suffix,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 22,
          minHeight: 22,
        ),
      ),
      //Focus Settings
      onFieldSubmitted: (value) => onFieldSubmitted?.call(),
      obscureText: obscureText,
      keyboardType: keyboardType,
      //Cursor Settings
      cursorColor: tdtextColor,
      cursorErrorColor: tdRed,
      cursorOpacityAnimates: true,
      cursorRadius: const Radius.circular(40),
      //Typed Text Settings
      style: GoogleFonts.karla(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  InputBorder _getBorder({bool isError = false}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: isError ? 2 : 0,
        color: isError ? tdRed : Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(100),
    );
  }
}
