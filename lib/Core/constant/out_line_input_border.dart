import 'package:flutter/material.dart';
import 'package:workshop_manager/Core/utils/app_colors.dart';

InputBorder outLineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.grey9));
}
