import 'package:go_router/go_router.dart';
import 'package:workshop_manager/Core/app/routes.dart';
import 'package:workshop_manager/Feature/IntroScreen/presentation/Auth/Login/views/login_screen.dart';
import 'package:workshop_manager/Feature/IntroScreen/presentation/Auth/Register/views/register_screen.dart';

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
      path: Routes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
