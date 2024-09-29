import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomAddImage extends StatelessWidget {
  const CustomAddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DottedBorder(
            strokeWidth: 2,
            borderType: BorderType.Circle,
            dashPattern: const [8, 4],
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.greyEE,
              ),
              child: const Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 40,
                  color: AppColors.grey9,
                ),
              ),
            )),
        width(12),
        const CustomAppText(
          text: "اضف صورة ",
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
