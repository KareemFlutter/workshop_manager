import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  const CustomTextFormFiled(
      {super.key,
      this.obscureText = false,
      required this.controller,
      this.hint,
      this.suffixIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
