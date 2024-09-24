import 'package:flutter/material.dart';
import 'package:workshop_manager/Core/extensions/extensions.dart';

import '../../../../../Core/utils/app_colors.dart';
import '../../../../../Core/widget/custom_app_text.dart';

class CustomRowCheckBoxAndForgetPassword extends StatelessWidget {
  const CustomRowCheckBoxAndForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CustomAppText(
              text: "تذكرنى",
            ),
            Checkbox(
              activeColor: AppColors.primary,
              value: true,
              onChanged: (val) {},
            )
          ],
        ),
        const CustomAppText(
          text: "هل نسيت كلمة المرور؟",
          color: AppColors.redED,
        ).onTap(() {})
      ],
    );
  }
}
