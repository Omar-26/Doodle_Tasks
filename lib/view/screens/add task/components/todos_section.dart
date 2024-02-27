import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/utils/validators.dart';
import 'package:todo_app/view/widgets/inputs/Input_Field.dart';

class ToDosSection extends StatelessWidget {
  final List<TextEditingController> controllers;
  final void Function(int) onDeleteTodo;

  const ToDosSection({
    super.key,
    required this.controllers,
    required this.onDeleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ToDos",
          style: GoogleFonts.karla(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ), //To_Dos Text
        const SizedBox(height: 10),
        ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.start,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          addAutomaticKeepAlives: false,
          children: [
            for (var i = 0; i < controllers.length; i++) ...[
              InputField(
                controller: controllers[i],
                hintText: 'ToDo ${i + 1}',
                validator: Validators.nonEmpty,
                keyboardType: TextInputType.text,
                prefix: SvgPicture.asset('assets/clipboard.svg'),
                suffix: i != 0
                    ? IconButton(
                        icon: const Icon(
                          Icons.highlight_remove_rounded,
                          color: tdRed,
                          size: 30,
                        ),
                        onPressed: () => onDeleteTodo(i),
                      )
                    : null,
              ),
              if (i != controllers.length - 1) const SizedBox(height: 14),
            ]
          ],
        )
      ],
    );
  }
}
