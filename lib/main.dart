// ignore_for_file: unused_shown_name

import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        Container,
        Icon,
        Icons,
        MaterialApp,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        TextStyle,
        ThemeData,
        ThemeMode,
        Widget,
        runApp;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:ssedisdik/src/utils/theme/theme.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.landscapeRight, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'skrisspi',
      theme: SSETheme.lightTheme,
      darkTheme: SSETheme.darkTheme,
      themeMode: ThemeMode.light,

      // home: Home(),
      home: SplashScreen(),
    );
  }
}
