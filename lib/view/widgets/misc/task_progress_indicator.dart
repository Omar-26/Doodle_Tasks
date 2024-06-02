import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class TaskProgressIndicator extends StatelessWidget {
  final double progress;
  final double size;

  const TaskProgressIndicator({
    super.key,
    required this.progress,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Positioned.fill(
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: progress),
              duration: const Duration(milliseconds: 700),
              builder: (context, progress, _) => CircularProgressIndicator(
                value: progress,
                color: tdBlue,
                backgroundColor: tdtextColor,
                strokeWidth: size / 7,
                strokeCap: StrokeCap.round,
                semanticsLabel: '${(progress * 100).toInt()}%',
              ),
            ),
          ),
          Center(
            child: Text(
              '${(progress * 100).toInt()}%',
              style: GoogleFonts.karla(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: size / 4,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // style: TextStyle(
              //   fontSize: size / 4,
              //   fontWeight: FontWeight.w900,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
