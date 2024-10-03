import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshop_manager/Core/constant/app_sized.dart';
import 'package:workshop_manager/Core/extensions/extensions.dart';
import 'package:workshop_manager/Core/widget/custom_drop_down_container.dart';

import '../../../../Core/app/routes.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import 'custom_text_form_filed.dart';

class CustomRowWorkingHourseAndWorkingDays extends StatelessWidget {
  const CustomRowWorkingHourseAndWorkingDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppText(
                text: "مواعيد العمل ",
                size: 14,
                color: AppColors.black13,
              ),
              height(4),
              CustomTextFormFiled(
                controller: TextEditingController(),
                hint: "اختار مواعيد العمل ",
                enabled: false,
              ).onTap(() {
                context.push(Routes.workshopWorkingTime);
              }),
            ],
          ),
        ),
        width(16),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppText(
                text: "القدرة الاستيعابية ",
                size: 14,
                color: AppColors.black13,
              ),
              height(4),
              CustomDropDownContainer(
                hint: "3",
                borderRadius: BorderRadius.circular(8),
              )
            ],
          ),
        ),
      ],
    );
  }
}
