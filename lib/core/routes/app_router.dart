import 'package:court_click/core/routes/app_routes.dart';
import 'package:court_click/presentation/screens/home_screen/home_screen.dart';
import 'package:court_click/presentation/screens/splash_screen/splash_screen.dart';
import 'package:court_click/presentation/screens/user_name_screen/user_name_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.userName:(context) => const UserNameScreen(),
    AppRoutes.home:(context) => const HomeScreen(),
  };
}
