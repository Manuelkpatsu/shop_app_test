import 'package:flutter/material.dart';

import 'core/locator.dart';
import 'screen/home/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  setUpLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}
