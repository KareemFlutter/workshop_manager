import 'package:flutter/material.dart';

class CustomSeachBar extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  const CustomSeachBar({
    super.key,
    this.hintText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
