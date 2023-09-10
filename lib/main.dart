import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers.dart';

import 'core/exceptions/failure.dart';
import 'core/locator.dart';
import 'screen/home/home_screen.dart';
import 'theme/app_theme.dart';

void main() async {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      setUpLocator();

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.dumpErrorToConsole(details);
        if (kReleaseMode) exit(1);
      };

      runApp(const App());
    },
    (error, stack) {
      sl.get<Logger>().e('Unhandled exception', error: error, stackTrace: stack);
      String errorMessage;
      if (error is Failure) {
        errorMessage = error.message;
      } else {
        errorMessage = 'Sorry!\nAn error occurred. Please try again.';
      }
      Get.snackbar(
        'Error!',
        errorMessage,
        colorText: Colors.white,
        backgroundColor: Colors.black,
        icon: const Icon(Icons.error_outline_rounded, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    },
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        home: const HomeScreen(),
      ),
    );
  }
}
