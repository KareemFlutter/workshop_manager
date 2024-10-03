import 'package:go_router/go_router.dart';
import 'package:workshop_manager/Core/app/routes.dart';
import 'package:workshop_manager/Feature/Auth/ForgetPassword/Presentation/views/forget_password_screen.dart';
import 'package:workshop_manager/Feature/Auth/Login/presentation/views/login_screen.dart';
import 'package:workshop_manager/Feature/Auth/OTP/data/model/otp_model.dart';
import 'package:workshop_manager/Feature/Auth/OTP/presentation/views/otp_screen.dart';
import 'package:workshop_manager/Feature/Auth/ResetPassword/Presentation/Views/resest_password_screen.dart';
import 'package:workshop_manager/Feature/Auth/register/presentation/views/register_screen.dart';
import 'package:workshop_manager/Feature/NavBar/Presentation/views/nav_bar_screen.dart';
import 'package:workshop_manager/Feature/add_workshop/Presentation/views/add_work_shop.dart';
import 'package:workshop_manager/Feature/workshop_working_time/presentation/views/workshop_working_time_screen.dart';
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
    GoRoute(
        path: "/${Routes.otp}/:phone",
        name: Routes.otp,
        builder: (context, state) {
          final phone = state.pathParameters['phone'];
          return OtpScreen(
            phone: phone!,
          );
        }),
    GoRoute(
      path: Routes.resetPassword,
      builder: (context, state) {
        final model = state.extra as OtpModel;
        return ResestPasswordScreen(
          model: model,
        );
      },
    ),
    GoRoute(
      path: Routes.navbar,
      builder: (context, state) => const NavBarScreen(),
    ),
    GoRoute(
      path: Routes.addWorkShop,
      builder: (context, state) => const AddWorkShopScreen(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: Routes.workshopWorkingTime,
      builder: (context, state) => const WorkshopWorkingTimeScreen(),
    )
  ],
);
