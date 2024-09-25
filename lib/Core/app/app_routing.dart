import 'package:go_router/go_router.dart';
import 'package:workshop_manager/Core/app/routes.dart';
import 'package:workshop_manager/Feature/Auth/ForgetPassword/Presentation/views/forget_password_screen.dart';
import 'package:workshop_manager/Feature/Auth/Login/presentation/views/login_screen.dart';

import '../../Feature/IntroScreen/presentation/views/intro_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.forgetPassword,
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
  ],
);
