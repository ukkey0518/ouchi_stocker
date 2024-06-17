import 'package:flutter/material.dart';
import 'package:ouchi_stocker/constants/theme.dart';
import 'package:ouchi_stocker/view/screens/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(context),
      darkTheme: AppTheme.dark(context),
      home: const HomeScreen(),
    );
  }
}
