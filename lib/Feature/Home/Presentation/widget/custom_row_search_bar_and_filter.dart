import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workshop_manager/Core/widget/custom_seach_bar.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_imgaes.dart';

class CustomRowSearchBarAndFilter extends StatelessWidget {
  const CustomRowSearchBarAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          flex: 5,
          child: CustomSeachBar(
            hintText: "بحث",
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.grey41,
            ),
          ),
        ),
        Flexible(
          child: Container(
            height: 44,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: AppColors.grey66,
                  offset: Offset(0, 4),
                ),
                BoxShadow(
                  blurRadius: 4,
                  color: AppColors.grey66,
                  offset: Offset(1, 0),
                )
              ],
              color: AppColors.white,
            ),
            child: SvgPicture.asset(AppImages.filter),
          ),
        )
      ],
    );
  }
}
