import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workshop_manager/Core/utils/app_colors.dart';
import 'package:workshop_manager/Core/utils/app_imgaes.dart';
import 'package:workshop_manager/Core/widget/custom_app_text.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/widget/custom_app_bar.dart';
import '../widget/custom_row_search_bar_and_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        color: AppColors.primary,
        title: "اختار المراكز ",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomRowSearchBarAndFilter(),
            height(32),
            const CustomAppText(
              text: "اختار المراكز ",
              fontWeight: FontWeight.w700,
            ),
            height(4),
            DottedBorder(
                color: AppColors.primary,
                padding: const EdgeInsets.all(20),
                radius: const Radius.circular(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomAppText(
                      text: "اضف مركز",
                      size: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                    width(8),
                    SvgPicture.asset(AppImages.add)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
