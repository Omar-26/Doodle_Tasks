import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors.dart';
import 'logo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final Widget? trailing;

  const CustomAppBar({super.key, this.text, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      elevation: 0,
      backgroundColor: tdbgColor,
      iconTheme: const IconThemeData(
        color: tdtextColor,
        size: 30,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: text != null
            ? Text(
                text!,
                style: GoogleFonts.karla(
                  textStyle: const TextStyle(
                    color: tdtextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ), //Google Fonts
              )
            : const Logo(),
      ),
      actions: trailing != null ? [trailing!, const SizedBox(width: 27)] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
