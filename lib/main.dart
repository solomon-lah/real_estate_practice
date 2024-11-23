import 'dart:io';

import 'package:flutter/material.dart';
import 'package:real_estate/const_providers/color_provider.dart';
import 'package:real_estate/const_providers/text_provider.dart';
import 'package:real_estate/screens/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  final context = SecurityContext.defaultContext;
  context.allowLegacyUnsafeRenegotiation = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (p0, p1, p2) {
      return MaterialApp(
        title: TextProvider.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorProvider.primaryColor,
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      );
    });
  }
}
