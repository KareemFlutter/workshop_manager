import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop_manager/Core/constant/end_points.dart';
import 'package:workshop_manager/Feature/Login/data/repos_impl/login_repo_impl.dart';
import 'package:workshop_manager/Feature/Login/data/source/login_source.dart';
import 'package:workshop_manager/Feature/Login/data/source/login_source_impl.dart';
import 'package:workshop_manager/Feature/Login/domain/repos/login_repo.dart';
import 'package:workshop_manager/Feature/Login/presentation/cubit/login_cubit.dart';
import 'Core/network/dio/base_dio.dart';
import 'Core/network/dio/dio_client.dart';
import 'Core/network/dio/dio_interceptor.dart';

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
}

void _registerRepos() {
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl(getIt()));
}

void _registerFactory() {
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
