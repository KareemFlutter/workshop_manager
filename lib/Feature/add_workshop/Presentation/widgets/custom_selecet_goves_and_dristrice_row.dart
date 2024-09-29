import 'package:flutter/material.dart';
import 'package:workshop_manager/Core/constant/app_sized.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_drop_down_container.dart';

class CustomSelecetGovesAndDristriceRow extends StatelessWidget {
  const CustomSelecetGovesAndDristriceRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! Goves
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppText(
                text: "المحافظة",
                size: 14,
                color: AppColors.black13,
              ),
              height(4),
              const CustomDropDownContainer(
                hint: "اختار المحافظة",
              ),
            ],
          ),
        ),
        width(16),
        //! Distric
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppText(
                text: "المنطقة",
                size: 14,
                color: AppColors.black13,
              ),
              height(4),
              const CustomDropDownContainer(
                hint: "اختار المنطقة",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
