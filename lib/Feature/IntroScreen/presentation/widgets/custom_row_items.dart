import 'package:flutter/material.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_laguage_button.dart';

class CustomRowItems extends StatelessWidget {
  const CustomRowItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomAppText(
          text: "تخطي",
          color: AppColors.primary,
          size: 14,
          fontWeight: FontWeight.w700,
        ),
        Image.asset(AppImages.logo),
        const CustomLaguageButton(),
      ],
    );
  }
}
