import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_work_shop_state.dart';

class AddWorkShopCubit extends Cubit<AddWorkShopState> {
  AddWorkShopCubit() : super(AddWorkShopInitial());

  TextEditingController workshopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
}
