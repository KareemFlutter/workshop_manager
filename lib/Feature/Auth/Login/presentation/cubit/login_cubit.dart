import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:workshop_manager/Feature/Auth/Login/data/models/login_model.dart';
import 'package:workshop_manager/Feature/Auth/Login/domain/repos/login_repo.dart';

import '../../../../../Core/service/auth_manager.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObsecure = false;
  final formkey = GlobalKey<FormState>();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId = '';
  String deviceName = '';
  bool isChecked = false;

  Future<void> login() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
      deviceName = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor!;
      deviceName = iosInfo.name;
    }
    final isValid = formkey.currentState!.validate();
    if (isValid) {
      emit(LoginLoadedState());
      final result = await loginRepo.login(
        phone: nameController.text,
        password: passwordController.text,
        deviceId: "ewyd-23ew",
        deviceToken: "233323222323",
        devicename: "i phone",
      );
      result.fold(
        (failure) {
          emit(
            LoginFauilreState(failure.message),
          );
        },
        (result) async {
          await AuthenticationManager().setToken(result.authorization!.token!);
          //print("==================================${result.token}");
          emit(LoginSuccessState(result));
        },
      );
    }
  }

  void changeObscure() {
    isObsecure = !isObsecure;
    emit(ChangeObscureState());
  }

  void changeCheckBoxValu(bool value) {
    isChecked = !isChecked;
    emit(ChangeCheckBoxValue());
  }
}
