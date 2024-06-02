import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors.dart';
import 'logo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? text;
  final Widget? trailing;
  final bool? centerTitle;

  const CustomAppBar({super.key, this.text, this.trailing, this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      elevation: 0,
      centerTitle: centerTitle,
      backgroundColor: tdbgColor,
      iconTheme: const IconThemeData(
        color: tdtextColor,
        size: 30,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: text != null ? text! : const Logo(),
      ),
      actions: trailing != null ? [trailing!, const SizedBox(width: 27)] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
