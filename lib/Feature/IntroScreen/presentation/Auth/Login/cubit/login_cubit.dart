import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObsecure = false;
  final formkey = GlobalKey<FormState>();
}
