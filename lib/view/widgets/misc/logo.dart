import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/constants/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/logo.svg',
          width: 40,
        ),
        const SizedBox(width: 12),
        const Text(
          'ToDo',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: tdtextColor,
          ),
        ),
      ],
    );
  }
}
