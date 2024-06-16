import 'package:flutter/material.dart';
import 'package:ouchi_stocker/constants/color_schemes.dart';
import 'package:ouchi_stocker/view/screens/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: AppColorSchemes.light,
        scaffoldBackgroundColor: AppColorSchemes.light.surface,
        canvasColor: AppColorSchemes.light.surface,
      ),
      darkTheme: ThemeData(
        colorScheme: AppColorSchemes.dark,
        scaffoldBackgroundColor: AppColorSchemes.dark.surface,
        canvasColor: AppColorSchemes.dark.surface,
      ),
      home: const HomeScreen(),
    );
  }
}
