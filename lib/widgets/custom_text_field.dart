import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController c;
  final String hintText;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const CustomTextField(
      {super.key,
      required this.c,
      required this.hintText,
      this.inputFormatters,
      this.onSubmitted,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: c,
      decoration: InputDecoration(hintText: hintText),
      inputFormatters: inputFormatters,
      onSubmitted: onSubmitted,
      onTapOutside: (event) => FocusScope.of(context).requestFocus(FocusNode()),
    );
  }
}
