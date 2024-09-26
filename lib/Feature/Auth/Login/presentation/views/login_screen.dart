import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_manager/Core/func/show_toast.dart';
import 'package:workshop_manager/Core/utils/app_colors.dart';
import 'package:workshop_manager/Core/widget/custom_app_text.dart';
import 'package:workshop_manager/di.dart';
import '../../../../../Core/constant/app_sized.dart';
import '../../../../../Core/widget/custom_app_button.dart';
import '../Widgets/custom_row_arrow_back_and_widget.dart';
import '../Widgets/custom_row_check_box_and_forget_password.dart';
import '../Widgets/custom_text_form_filed_section.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadedState) {
            const CircularProgressIndicator();
          } else if (state is LoginSuccessState) {
            showToast(message: "Login Successfully");
          } else if (state is LoginFauilreState) {
            showToast(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return Scaffold(
            body: state is LoginLoadedState
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomRowArrowBackAndWidget(),
                          height(32),
                          const CustomAppText(
                            text: "تسجل الدخول",
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                            size: 32,
                          ),
                          height(16),
                          const CustomAppText(
                            text: "ادخل بريدك الالكترونى او رقم الهاتف  واسمك",
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey66,
                            size: 14,
                          ),
                          height(32),
                          const CustomTextFormFiledSection(),
                          height(8),
                          const CustomRowCheckBoxAndForgetPassword(),
                          height(heightSize(context) * 0.25),
                          CustomAppButton(
                            text: "تسجيل دخول",
                            width: double.maxFinite,
                            radius: 24,
                            onPressed: () {
                              cubit.login();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
