import 'package:flutter/material.dart';
import 'custom_app_button.dart';

class CustomContainerButton extends StatelessWidget {
  final String text;
  const CustomContainerButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: CustomAppButton(
        text: text,
        width: double.maxFinite,
        radius: 24,
      ),
    );
  }
}
