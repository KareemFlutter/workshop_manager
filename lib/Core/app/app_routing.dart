import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshop_manager/Core/app/routes.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const Scaffold(),
    ),
  ],
);
