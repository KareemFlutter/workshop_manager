import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshop_manager/Core/constant/app_sized.dart';
import 'package:workshop_manager/Core/utils/app_colors.dart';
import 'package:workshop_manager/Core/widget/custom_app_bar.dart';
import 'package:workshop_manager/Feature/add_workshop/cubit/add_work_shop_cubit.dart';
import '../../../../Core/widget/custom_container_button.dart';
import '../widgets/custom_add_image.dart';
import '../widgets/custom_add_workshop_fileds.dart';

class AddWorkShopScreen extends StatelessWidget {
  const AddWorkShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddWorkShopCubit(),
      child: Scaffold(
        appBar: appBar(
          title: "الاعدادات ",
          textColor: AppColors.black13,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    children: [
                      const CustomAddImage(),
                      height(24),
                      const CustomAddWorkshopFileds(),
                    ],
                  ),
                ),
              ),
            ),
            const CustomContainerButton(text: "حفظ")
          ],
        ),
      ),
    );
  }
}
