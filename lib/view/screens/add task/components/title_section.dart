import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/utils/validators.dart';
import 'package:todo_app/view/widgets/inputs/Input_Field.dart';

class TitleSection extends StatelessWidget {
  final TextEditingController controller;

  const TitleSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Title",
        style: GoogleFonts.karla(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ), // Google Fonts
      ),
      const SizedBox(height: 7),
      InputField(
        controller: controller,
        focusNode: FocusNode(),
        validator: Validators.nonEmpty,
        hintText: "What would you like to do?",
        prefix: const Icon(Icons.task_alt_rounded, color: tdBlue, size: 35),
      ), //Title Box
    ]);
  }
}
