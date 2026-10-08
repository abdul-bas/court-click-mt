import 'package:court_click/core/routes/app_router.dart';
import 'package:court_click/core/routes/app_routes.dart';
import 'package:court_click/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MachineTestApp());
}

class MachineTestApp extends StatelessWidget {
  const MachineTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      initialRoute: AppRoutes.splash,
      routes: AppRouter.routes
    );
  }
}
