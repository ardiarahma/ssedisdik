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
import 'package:provider/provider.dart';
import 'package:ssedisdik/src/features/authentication/controllers/home/documents_controller.dart';
import 'package:ssedisdik/src/features/authentication/controllers/login/session_controller.dart';
import 'package:ssedisdik/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:ssedisdik/src/utils/theme/theme.dart';

void main() {
  Get.put(DocumentsController());
  runApp(ChangeNotifierProvider(
    create: (context) => SessionManager(),
    child: MyApp(),
  ));
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
