import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_manager/Core/extensions/extensions.dart';
import 'package:workshop_manager/Core/utils/app_colors.dart';
import 'package:workshop_manager/Core/widget/custom_app_text.dart';
import '../../../../Core/constant/app_sized.dart';
import '../cubit/workshop_working_time_cubit.dart';

class CustomWorkshopWorkingTimeListBody extends StatefulWidget {
  final String dayName;
  final Function()? onTapfirstFunction;
  final String fromTime;
  final Function()? onTapsecondFunction;
  final String toTime;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomWorkshopWorkingTimeListBody({
    super.key,
    required this.dayName,
    this.onTapfirstFunction,
    required this.fromTime,
    this.onTapsecondFunction,
    required this.toTime,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomWorkshopWorkingTimeListBody> createState() =>
      _CustomWorkshopWorkingTimeListBodyState();
}

class _CustomWorkshopWorkingTimeListBodyState
    extends State<CustomWorkshopWorkingTimeListBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkshopWorkingTimeCubit, WorkshopWorkingTimeState>(
      builder: (context, state) {
        //final cubit = context.read<WorkshopWorkingTimeCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //! Day name
                Expanded(
                  flex: 3,
                  child: CustomAppText(
                    text: widget.dayName,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                //! Work hours
                Expanded(
                  flex: 4,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: widget.onTapfirstFunction,
                          child: FittedBox(
                            child: CustomAppText(
                              text: widget.fromTime,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      width(16),
                      Flexible(
                        child: InkWell(
                          onTap: widget.onTapsecondFunction,
                          child: FittedBox(
                            child: CustomAppText(
                              text: widget.toTime,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                width(16),
                //! Status switch
                Expanded(
                  flex: 2,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: widget.value ? AppColors.greyD9 : AppColors.grey9,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      mainAxisAlignment: widget.value
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: FittedBox(
                            child: CustomAppText(
                              text: widget.value ? 'تفعيل' : 'معطل',
                            ),
                          ),
                        ),
                        width(12),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.value
                                ? AppColors.primary
                                : AppColors.black13,
                          ),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    setState(() {
                      widget.onChanged(!widget.value);
                    });
                  }),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
