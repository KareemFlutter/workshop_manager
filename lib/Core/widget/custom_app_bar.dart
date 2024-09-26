import 'package:flutter/material.dart';
import 'package:workshop_manager/Core/utils/app_colors.dart';
import 'package:workshop_manager/Core/widget/custom_app_text.dart';

PreferredSizeWidget? appBar({
  Color? color,
  Widget? leading,
  List<Widget>? actions,
  required String title,
}) {
  return AppBar(
    backgroundColor: color,
    automaticallyImplyLeading: false,
    leading: leading,
    actions: actions,
    title: CustomAppText(
      text: title,
      color: AppColors.white,
      fontWeight: FontWeight.w700,
      size: 16,
    ),
  );
}
