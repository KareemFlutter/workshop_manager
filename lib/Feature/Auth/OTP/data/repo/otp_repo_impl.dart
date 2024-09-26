import 'package:dartz/dartz.dart';
import 'package:workshop_manager/Core/network/error/failure.dart';
import 'package:workshop_manager/Feature/Auth/OTP/data/model/otp_model.dart';
import 'package:workshop_manager/Feature/Auth/OTP/domain/repos/otp_repo.dart';
import '../source/base/otp_source.dart';

class OtpRepoImpl implements OtpRepo {
  final OtpSource source;

  OtpRepoImpl(this.source);
  @override
  Future<Either<Failure, OtpModel>> otp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await source.otp(
        phone: phone,
        otp: otp,
      );
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
        OtpModel.fromJson(response),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
