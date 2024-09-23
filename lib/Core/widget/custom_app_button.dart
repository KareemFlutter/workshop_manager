import 'package:flutter/material.dart';
import 'package:workshop_manager/Core/utils/app_colors.dart';
import 'package:workshop_manager/Core/widget/custom_app_text.dart';

class CustomAppButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? radius;
  final Color? containerColor;
  final Color? textColor;
  final double? width;
  final Color? borderColor;
  const CustomAppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.radius,
    this.containerColor,
    this.textColor,
    this.width,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: containerColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(radius ?? 8),
        border: Border.all(color: borderColor ?? AppColors.primary),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: CustomAppText(
          text: text,
          color: textColor ?? AppColors.white,
          size: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
