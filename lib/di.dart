import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop_manager/Core/constant/end_points.dart';
import 'package:workshop_manager/Feature/Auth/ForgetPassword/Presentation/cubit/forget_password_cubit.dart';
import 'package:workshop_manager/Feature/Auth/ForgetPassword/data/source/base/forget_password_soruce.dart';
import 'package:workshop_manager/Feature/Auth/ForgetPassword/domain/repos/forget_password_repo.dart';
import 'package:workshop_manager/Feature/Auth/Login/data/repos_impl/login_repo_impl.dart';
import 'package:workshop_manager/Feature/Auth/Login/data/source/login_source.dart';
import 'package:workshop_manager/Feature/Auth/Login/data/source/login_source_impl.dart';
import 'package:workshop_manager/Feature/Auth/Login/domain/repos/login_repo.dart';
import 'package:workshop_manager/Feature/Auth/Login/presentation/cubit/login_cubit.dart';
import 'package:workshop_manager/Feature/Auth/OTP/data/repo/otp_repo_impl.dart';
import 'package:workshop_manager/Feature/Auth/OTP/data/source/base/otp_source.dart';
import 'package:workshop_manager/Feature/Auth/OTP/data/source/impl/otp_source_impl.dart';
import 'package:workshop_manager/Feature/Auth/ResetPassword/Presentation/cubit/resetpassword_cubit.dart';
import 'package:workshop_manager/Feature/Auth/ResetPassword/data/repo/reset_password_repo_impl.dart';
import 'package:workshop_manager/Feature/Auth/ResetPassword/data/source/base/reset_password_source.dart';
import 'package:workshop_manager/Feature/Auth/ResetPassword/data/source/impl/reset_password_source_impl.dart';
import 'package:workshop_manager/Feature/Auth/ResetPassword/domain/repos/reset_password_repo.dart';
import 'package:workshop_manager/Feature/Auth/register/data/repos/register_repo_impl.dart';
import 'package:workshop_manager/Feature/Auth/register/data/source/base/register_source.dart';
import 'package:workshop_manager/Feature/Auth/register/data/source/impl/register_source_impl.dart';
import 'package:workshop_manager/Feature/Auth/register/domian/repo/register_repo.dart';
import 'package:workshop_manager/Feature/Auth/register/presentation/cubit/register_cubit.dart';
import 'package:workshop_manager/Feature/add_workshop/Presentation/cubit/add_work_shop_cubit.dart';
import 'package:workshop_manager/Feature/add_workshop/data/repo/add_workshop_repo_imol.dart';
import 'package:workshop_manager/Feature/add_workshop/data/source/base/add_workshop_source.dart';
import 'package:workshop_manager/Feature/add_workshop/data/source/impl/add_workshop_source_impl.dart';
import 'package:workshop_manager/Feature/add_workshop/domain/respo/add_workshop_repo.dart';
import 'package:workshop_manager/Feature/goves_and_district/Presentation/cubit/goves_and_district_cubit.dart';
import 'package:workshop_manager/Feature/goves_and_district/data/repo/goves_and_district_repo_impl.dart';
import 'package:workshop_manager/Feature/goves_and_district/data/source/base/goves_and_distric_source.dart';
import 'package:workshop_manager/Feature/goves_and_district/data/source/impl/goves_and_distict_source_impl.dart';
import 'package:workshop_manager/Feature/goves_and_district/domain/repo/goves_and_district_repo.dart';
import 'Core/network/dio/base_dio.dart';
import 'Core/network/dio/dio_client.dart';
import 'Core/network/dio/dio_interceptor.dart';
import 'Feature/Auth/ForgetPassword/data/repo/forget_password_repo_impl.dart';
import 'Feature/Auth/ForgetPassword/data/source/impl/forget_password_source_impl.dart';
import 'Feature/Auth/OTP/domain/repos/otp_repo.dart';
import 'Feature/Auth/OTP/presentation/cubit/otp_cubit.dart';

GetIt getIt = GetIt.instance;
SharedPreferences preferences = getIt<SharedPreferences>();
Future<void> initDependencyInjection() async {
  await _registerSingletons();
  _registerDataSources();
  _registerRepos();
  _registerFactory();
}

Future<void> _registerSingletons() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  BaseOptions options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      followRedirects: false,
      headers: {
        "Content-Type": "application/json",
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30));

  getIt.registerSingleton<BaseDio>(DioClient(
      options: options, dio: Dio(), interceptors: [DioInterceptor()]));
  getIt.registerSingleton<SharedPreferences>(preferences);
}

void _registerDataSources() {
  getIt.registerSingleton<LoginSource>(LoginSourceImpl(getIt()));
  getIt.registerSingleton<ForgetPasswordSource>(
      ForgetPasswordSourceImpl(getIt()));
  getIt.registerSingleton<OtpSource>(OtpSourceImpl(getIt()));
  getIt
      .registerSingleton<ResetPasswordSource>(ResetPasswordSourceImpl(getIt()));
  getIt.registerSingleton<RegisterSource>(RegisterSourceImpl(getIt()));
  getIt.registerSingleton<AddWorkshopSource>(AddWorkshopSourceImpl(getIt()));
  getIt.registerSingleton<GovesAndDistricSource>(
      GovesAndDistictSourceImpl(getIt()));
}

void _registerRepos() {
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl(getIt()));
  getIt.registerSingleton<ForgetPasswordRepo>(ForgetPasswordRepoImpl(getIt()));
  getIt.registerSingleton<OtpRepo>(OtpRepoImpl(getIt()));
  getIt.registerSingleton<ResetPasswordRepo>(ResetPasswordRepoImpl(getIt()));
  getIt.registerSingleton<RegisterRepo>(RegisterRepoImpl(getIt()));
  getIt.registerSingleton<AddWorkshopRepo>(AddWorkshopRepoImol(getIt()));
  getIt.registerSingleton<GovesAndDistrictRepo>(
      GovesAndDistrictRepoImpl(getIt()));
}

void _registerFactory() {
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
  getIt.registerFactory<OtpCubit>(() => OtpCubit(getIt()));
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<AddWorkShopCubit>(() => AddWorkShopCubit(getIt()));
  getIt.registerFactory<GovesAndDistrictCubit>(
      () => GovesAndDistrictCubit(getIt()));
}
