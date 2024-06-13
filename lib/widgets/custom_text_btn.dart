import 'package:flutter/material.dart';

class CustomTextBtn extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color? fgColor;
  final Color? bgColor;
  const CustomTextBtn(
      {super.key,
      required this.onTap,
      required this.child,
      this.fgColor,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        // style: ,
        style: TextButton.styleFrom(
            foregroundColor: fgColor, backgroundColor: bgColor),
        //
        child: child);
  }
}
