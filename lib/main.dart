import 'package:blog_rivaan/core/theme/app_pallete.dart';
import 'package:blog_rivaan/core/theme/theme.dart';
import 'package:blog_rivaan/features/auth/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode.copyWith(
        scaffoldBackgroundColor: AppPallete.backgroundColor,
      ),
      home: SignUpPage(),
    );
  }
}

