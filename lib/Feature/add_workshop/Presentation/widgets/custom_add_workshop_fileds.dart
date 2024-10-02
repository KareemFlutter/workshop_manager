import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_manager/Core/widget/custom_drop_down_container.dart';
import 'package:workshop_manager/Feature/add_workshop/Presentation/widgets/custom_phone_number_row.dart';
import 'package:workshop_manager/Feature/add_workshop/Presentation/cubit/add_work_shop_cubit.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import 'custom_row_working_hourse_and_working_days.dart.dart';
import 'custom_selecet_goves_and_dristrice_row.dart';
import 'custom_text_form_filed.dart';

class CustomAddWorkshopFileds extends StatelessWidget {
  const CustomAddWorkshopFileds({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddWorkShopCubit, AddWorkShopState>(
      builder: (context, state) {
        final cubit = context.read<AddWorkShopCubit>();
        return SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppText(
                  text: "اسم المركز*",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                CustomTextFormFiled(
                  controller: cubit.workshopNameController,
                  hint: "فاست ريببر",
                ),
                height(16),
                const CustomSelecetGovesAndDristriceRow(),
                height(16),
                const CustomAppText(
                  text: "العنوان",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                CustomTextFormFiled(
                  controller: cubit.addressController,
                  hint: "ادخل عنوان مركز الصيانة",
                ),
                height(16),
                const CustomAppText(
                  text: "الموقع",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                CustomTextFormFiled(
                  controller: cubit.addressController,
                  hint: "20 شارع الرياض",
                  prefixIcon: const Icon(
                    Icons.location_on,
                    color: AppColors.orange,
                  ),
                ),
                height(16),
                const CustomPhoneNumberRow(),
                height(16),
                const CustomRowWorkingHourseAndWorkingDays(),
                height(16),
                const CustomAppText(
                  text: "التخصص",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                const CustomDropDownContainer(
                  hint: "اختار الماركات ",
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: AppColors.grey41,
                  ),
                ),
                height(16),
                const CustomAppText(
                  text: "الخدمات المقدمة",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                const CustomDropDownContainer(
                  hint: "اختار نوع الخدمات ",
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: AppColors.grey41,
                  ),
                ),
                height(16),
                const CustomAppText(
                  text: "عن المركز",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                CustomTextFormFiled(
                  controller: TextEditingController(),
                  hint: "اضف تعرف عن المركز ",
                  maxLines: 5,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
