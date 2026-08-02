import 'package:emi_calc/app/theme/app_theme.dart';
import 'package:emi_calc/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

class EmiCalcApp extends StatelessWidget {
  const EmiCalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMI Calc',
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,

      theme: AppTheme.lightTheme,

      darkTheme: AppTheme.darkTheme,

      home: const HomeScreen(),
    );
  }
}
