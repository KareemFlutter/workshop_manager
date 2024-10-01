import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/Auth/Login/data/models/login_model.dart';
import 'package:workshop_manager/Feature/Auth/register/data/source/base/register_source.dart';
import 'package:workshop_manager/Feature/Auth/register/domian/repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final RegisterSource source;

  RegisterRepoImpl(this.source);
  @override
  Future<Either<Failure, LoginModel>> register({
    required String name,
    required String phone,
    required String email,
    required String deviceName,
    required String password,
    required String confirmPassword,
    required String companyName,
    required String deviceId,
    required String deviceToken,
    required File taxImage,
    required File companyRegisteration,
  }) async {
    try {
      final response = await source.register(
          name: name,
          phone: phone,
          email: email,
          deviceName: deviceName,
          password: password,
          confirmPassword: confirmPassword,
          companyName: companyName,
          deviceId: deviceId,
          deviceToken: deviceToken,
          taxImage: taxImage,
          companyRegisteration: companyRegisteration);
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(LoginModel.fromJson(response['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
