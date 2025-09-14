import 'package:flutter/material.dart';
import 'package:trackizer/core/cofig/routes/app_router.dart';
import 'package:trackizer/core/cofig/theme/get_dark_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: getDarkTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
