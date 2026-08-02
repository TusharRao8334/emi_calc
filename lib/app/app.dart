import 'package:flutter/material.dart';

class EmiCalcApp extends StatelessWidget {
  const EmiCalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMI Calc',
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,

      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.green,
      ),

      home: const Scaffold(body: Center(child: Text('EMI Calc'))),
    );
  }
}
