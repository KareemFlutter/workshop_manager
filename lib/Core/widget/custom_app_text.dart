import 'package:flutter/material.dart';
import 'package:workshop_manager/Core/utils/app_colors.dart';

class CustomAppText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;
  const CustomAppText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.black13,
      ),
    );
  }
}
